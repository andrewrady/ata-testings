<template>
  <div class="form-row">
    <div class="form-group col-md-5">
      <input 
        v-if="!item.name"
        v-model="itemSearch"
        @keyup="debounceSearch"
        type="text" 
        class="form-control" 
        placeholder="name">
      <input 
        v-else
        v-model="item.name"
        @keyup="debounceSearch"
        type="text" 
        class="form-control" 
        placeholder="name">
      <template v-if="results.length">
        <div 
          class="card rounded-0"
          v-for="(item, index) in results"
          :key="index"
          @click="addItem(item)">
          <div class="card-body">
            {{ item.name }}
          </div>
        </div>
      </template>
    </div>
    <div class="form-group col-md-3">
      <input 
        type="number" 
        step="0.01"
        class="form-control"
        placeholder="price"
        v-model="item.price">
    </div>
    <div class="form-group col-md-">
      <input 
        v-model="amount"
        type="text" 
        class="form-control" 
        placeholder="quantity">
    </div>
    <div class="form-group">
      <div class="form-check">
        <input class="form-check-input" type="checkbox" :checked="item.tax">
        <label class="form-check-label">tax</label>
      </div>
    </div>
    <div class="form-group mx-3">
      <i class="far fa-times-circle red close" @click="removeItem" v-if="index"></i>
    </div>
  </div>
</template>

<script>
export default {
  name: 'pos-item',
  props: {
    item: Object,
    index: Number
  },
  data() {
    return {
      amount: null,
      itemSearch: '',
      results: [],
      loadingItemSearch: null,
      itemSearchTimer: null
    }
  },
  methods: {
    debounceSearch() {
      this.loadingItemSearch = true;
      clearTimeout(this.itemSearchTimer);
      this.searchTimer = setTimeout(() => {
        this.search();
      }, 1000);
    },
    search() {
      fetch('/v1/inventory/search', {
        method: 'post',
        headers: {
          'content-type': 'application/json'
        },
        body: JSON.stringify({ name: this.itemSearch })
      })
      .then(res => res.json())
      .then(res => {
        this.results = res;
      })
      .finally(() => {
        this.loadingItemSearch = false;
      })
    },
    addItem(item) {
      this.results = [];
      this.$emit('add', { item: item, index: this.index })
    },
    removeItem() {
      this.$emit('remove', this.index);
    }
  }
}
</script>