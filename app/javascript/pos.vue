<template>
  <div class="container">
    <h1>POS Terminal</h1>
    <div class="row">
      <div class="col-9">
      <form @submit.prevent>
        <div class="form-row">
          <div class="form-group d-flex">
            <input type="text"  class="form-control mx-2" placeholder="Search name">
            <button class="btn btn-primary">Search</button>
          </div>
        </div>
      </form>
      <pos-item
        v-for="(item, index) in items"
        :key="index"
        :index="index"
        :item="item">
      </pos-item>
      <button class="btn btn-primary" @click="items.push(itemTemplate)">Add Item</button>
      </div>
      <div class="col-3">
        <div class="alert alert-info rounded-circle total">
          <p>Total</p>
          {{ total}}
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
      return 0
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
  }
}
</script>