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
              class="card m-2 pointer" 
              style="width: 18rem;"
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
            :item="item">
          </pos-item>
        </template>
      </div>
      <div class="col-2 d-flex flex-column justify-content-center">
        <div class="alert alert-info rounded-circle pos-icon">
          <p>Total</p>
          {{ total | money }}
        </div>
        <div class="alert alert-success rounded-circle pos-icon pos-icon-button d-flex">
          <h4 class="align-self-center">Charge</h4>
        </div>
        <div class="alert alert-primary rounded-circle pos-icon pos-icon-button d-flex" @click="items.push(itemTemplate)">
          <h4 class="align-self-center">Add Item</h4>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import posItem from './postItem.vue';
export default {
  name: 'pos',
  components: {
    posItem
  },
  computed: {
    total() {
      return 20
    }
  },
  data() {
    return {
      searchTerm: '',
      searchTimer: null,
      loadingSearch: false,
      searchResults: [],
      activeStudent: null,
      items: [],
      itemTemplate: {
        name: '',
        price: null,
        tax: null,
      }
    }
  },
  mounted() {
    this.items.push(this.itemTemplate);
  },
  methods: {
    debounceSearch() {
      this.loadingSearch = true;
      clearTimeout(this.searchTimer);
      this.searchTimer = setTimeout(() => {
        this.search();
      }, 1000);
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
        this.searchResults = res;
      })
      .finally(() => {
        this.loadingSearch = false;
      })
    },
    setActiveStudent(student) {
      this.activeStudent = student;
      this.searchResults = [];
      this.searchTerm = '';
    }
  },
  filters: {
    money(value){
      let test = value;
      if(!test) 0;

      return test.toLocaleString('en-US', {
        style: 'currency',
        currency: 'USD'
      })
    }
  }
}
</script>