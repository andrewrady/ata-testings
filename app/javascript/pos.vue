<template>
  <div class="container">
    <h1>POS Terminal</h1>
    <div class="row">
      <div class="col-10">
        <template v-if="!activeStudent">
          <form @submit.prevent>
            <div class="form-row">
              <div class="form-group d-flex">
                <input 
                  type="text"  
                  class="form-control mx-2" 
                  placeholder="Search name" 
                  v-model="searchTerm" 
                  @keyup="debounceSearch">
                <button class="d-flex btn btn-primary">
                  <span v-if="loadingSearch" class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                  Search
                </button>
              </div>
            </div>
          </form>
          <div class="results d-flex flex-wrap my-2" v-if="searchResults.length">
            <div 
              class="card card-student m-2 pointer" 
              @click="setActiveStudent(student)"
              v-for="(student, index) in searchResults" 
              :key="index">
              <div class="card-body">
                <h5 class="card-title">{{ student.firstName }} {{ student.lastName }}</h5>
                <h6 class="card-subtitle mb-2 text-muted">Rank</h6>
                <div class="card-text">
                  <p>9105 W Laguna Ct, Boise Idaho</p>
                  <p>9105 W Laguna Ct, Boise Idaho</p>
                </div>
                <a :href="`/students/${student.id}/edit`" class="card-link" target="_blank">Profile</a>
              </div>
            </div>
          </div>
          <div v-else-if="hasSearched && !searchResults.length" class="alert alert-warning d-flex justify-content-between align-items-center">
            <p class="m-0">No students found</p>
            <i class="fas fa-times pointer" @click="clearSearch"></i>
          </div>
        </template>
        <template v-else>
          <div class="card w-50 my-3">
            <div class="card-header">
              <div class="d-flex justify-content-between">
                Active Student
                <i class="fas fa-times pointer" @click="activeStudent = null"></i>
              </div>
            </div>
            <div class="card-body">
              <h5 class="card-title">{{ activeStudent.firstName }} {{ activeStudent.lastName }}</h5>
              <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
              <a :href="`/students/${activeStudent.id}/edit`" class="card-link" target="_blank">Profile</a>
            </div>
          </div>
          <pos-item
            v-for="(item, index) in items"
            :key="index"
            :index="index"
            :item="item"
            @add="addItemContent"
            @remove="removeItem">
          </pos-item>
          <hr>
          <div class="form-row">
            <div class="form-group col-md-6">
              <label>Card Number</label>
              <input class="form-control" type="text" placeholder="Card Number" v-model="card.cardNumber">
            </div>
            <div class="form-group col-md-2">
              <label>Experation Month</label>
              <select v-model="card.cardExpMonth" class="form-control">
                <option 
                  v-for="(month, index) in expMonths"
                  :key="index">
                  {{ month }}  
                </option>
              </select>
            </div>
            <div class="form-group col-md-2">
              <label>Exp Years</label>
              <select v-model="card.expYears" class="form-control">
                <option
                  v-for="(year, index) in expYears"
                  :key="index">
                  {{ year }}
                </option>
              </select>
            </div>
            <div class="form-group col-md-2">
              <label>cvv</label>
              <input type="text" v-model="card.cVV" class="form-control">
            </div>
          </div>
        </template>
      </div>
      <div class="col-2 d-flex flex-column">
        <div class="alert alert-info rounded-circle pos-icon">
          <p>Total</p>
          {{ total | money }}
        </div>
        <div class="alert alert-success rounded-circle pos-icon pos-icon-button d-flex" @click="charge">
          <h4 class="align-self-center">Charge</h4>
        </div>
        <div class="alert alert-primary rounded-circle pos-icon pos-icon-button d-flex" @click="addItem">
          <h4 class="align-self-center">Add Item</h4>
        </div>
      </div>
    </div>
    <confirmation-modal ref="confirm"></confirmation-modal>
  </div>
</template>1
1
<script>1
import posItem from './postItem.vue'
import confirmationModal from './confirmModal'

export default {
  name: 'pos',
  components: {
    posItem,
    confirmationModal
  },
  computed: {
    total() {
      if(this.items.length == 1) {
        if(this.items[0].tax) {
          let tax = parseFloat(this.items[0].price) * this.taxPercent
          return parseFloat(this.items[0].price) + tax
        }
        return parseFloat(this.items[0].price)
      } else {
        return this.items.map(x => {
          if(x.tax) {
            let tax = parseFloat(x.price) * this.taxPercent
            return parseFloat(x.price) + tax
          } else {
            return parseFloat(x.price)
          }
        }).reduce((a,b) => {
          return a + b
        }, 0)
      }
    },
    expYears() {
      let currentYear = new Date().getFullYear()
      let decade = 10
      let results = [currentYear]
      for(let i = 0; i < decade; i++) {
        results.push(currentYear++)
      }
      return results
    }
  },
  data() {
    return { 
      searchTerm: '',
      searchTimer: null,
      loadingSearch: false,
      searchResults: [],
      hasSearched: false,
      activeStudent: null,
      taxPercent: 0.06,
      items: [],
      expMonths: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
      card: {
        cardNumber: '',
        cardExpMonth: '',
        cardExpYear: ''
      }
    }
  },
  mounted() {
    this.addItem();
  },
  methods: {
    async charge() {
      if(!this.activeStudent && !this.total) return;

      if(await this.$refs.confirm.open(`Are you sure you want to charge ${this.activeStudent.firstName} ${this.activeStudent.lastName} $${parseFloat(this.total)}?`)) {
        const content = {...this.card}
        content.total = this.total
        fetch('/v1/transactions', {
          method: 'post',
          headers: {
            'content-type': 'application/json'
          },
          body: JSON.stringify(content)
        })
        .then(res => res.json())
        .then(res => {
          history.pushState({url: `/student/${this.activeStudent.id}/edit`})
        })
      }
    },
    addItem() {
      const item = {
        name: '',
        price: 0,
        tax: null,
      }
      this.items.push(item)
    },
    debounceSearch() {
      if(!this.searchTerm) {
        this.clearSearch()
        return
      }

      this.loadingSearch = true
      clearTimeout(this.searchTimer)
      setTimeout(() => {
        this.search()
      }, 1000)
    },
    search() {
      fetch('/v1/students/search', {
        method: 'post',
        headers: {
          'content-type': 'application/json'
        },
        body: JSON.stringify({ name: this.searchTerm })
      })
      .then(res => res.json())
      .then(res => {
        this.searchResults = res
      })
      .finally(() => {
        this.hasSearched = true
        this.loadingSearch = false
      })
    },
    clearSearch() {
      this.searchTerm = ''
      this.searchResults = []
      this.hasSearched = false
    },
    setActiveStudent(student) {
      this.activeStudent = student
      this.searchResults = []
      this.searchTerm = ''
    },
    addItemContent(value) {
      let currentItem = this.items[value.index]
      currentItem.name = value.item.name
      currentItem.price = value.item.price
      currentItem.tax = value.item.tax
    },
    removeItem(value) {
      this.items.splice(value, 1)
    }
  },
  filters: {
    money(value){
      let test = value
      if(!test) test = 0

      return test.toLocaleString('en-US', {
        style: 'currency',
        currency: 'USD'
      })
    }
  }
}
</script>