<template>
  <div class="container">
    <h1>POS Terminal</h1>
    <div class="row">
      <div class="col-10">
      <form @submit.prevent>
        <div class="form-row">
          <div class="form-group d-flex">
            <input type="text"  class="form-control mx-2" placeholder="Search name">
            <button class="btn btn-primary">Search</button>
          </div>
        </div>
      </form>
      <div class="results d-flex my-2">
        <div class="card" style="width: 18rem;">
          <div class="card-body">
            <h5 class="card-title">Student Name</h5>
            <h6 class="card-subtitle mb-2 text-muted">Rank</h6>
            <div class="card-text">
              <p>9105 W Laguna Ct, Boise Idaho</p>
              <p>9105 W Laguna Ct, Boise Idaho</p>
            </div>
            <a href="#" class="card-link" target="_blank">Profile</a>
          </div>
        </div>
        <div class="card mx-2" style="width: 18rem;">
          <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="#" class="card-link">Card link</a>
          </div>
        </div>
      </div>
      <pos-item
        v-for="(item, index) in items"
        :key="index"
        :index="index"
        :item="item">
      </pos-item>
      <!-- <div class="d-flex justify-content-between">
        <button class="btn btn-success">Charge</button>
        <button class="btn btn-primary" @click="items.push(itemTemplate)">Add Item</button>
      </div> -->
      </div>
      <div class="col-2">
        <div class="alert alert-info rounded-circle pos-button">
          <p>Total</p>
          {{ total | money }}
        </div>
        <div class="alert alert-success rounded-circle pos-button d-flex">
          <h4 class="align-self-center">Charge</h4>
        </div>
        <div class="alert alert-primary rounded-circle pos-button d-flex" @click="items.push(itemTemplate)">
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
      items: [],
      itemTemplate: {
        name: '',
        price: null,
        tax: null
      }
    }
  },
  mounted() {
    this.items.push(this.itemTemplate);
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