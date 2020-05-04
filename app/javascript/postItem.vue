<template>
  <div class="form-row">
    <div class="spinner-holder">
      <div v-if="loadingItemSearch" class="spinner-border spinner-border-sm" role="status">
        <span class="sr-only">Loading...</span>
      </div>
    </div>
    <div class="form-group col-md-7">
      <input 
        v-model="itemSearch"
        @keyup="debounceSearch"
        type="text" 
        class="form-control" 
        placeholder="name">
      <template v-if="results.length">
        <div 
          class="card rounded-0 pointer"
          v-for="(item, index) in results"
          :key="index"
          @click="addItem(item)">
          <div class="card-body">
            {{ item.name }}
          </div>
        </div>
      </template>
      <div
        v-if="!results.length && hasSearched"
        class="card rounded-0">
        <div class="card-body">
        No results found
        </div>
      </div>
    </div>
    <div class="form-group col-md-3">
      <input 
        type="number" 
        step="0.01"
        class="form-control"
        placeholder="price"
        v-model="item.price">
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
      loadingItemSearch: false,
      itemSearchTimer: null,
      hasSearched: false
    }
  },
  methods: {
    debounceSearch() {
      this.loadingItemSearch = true;
      this.hasSearched = false;
      this.results = [];
      clearTimeout(this.itemSearchTimer);
      this.searchTimer = setTimeout(() => {
        this.search();
      }, 1000);
    },
    search() {
      if(!this.itemSearch.trim()) {
        this.loadingItemSearch = false;
        return;
      } 

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
        this.hasSearched = true;
      })
    },
    addItem(item) {
      this.results = [];
      this.hasSearched = false;
      this.$emit('add', { item: item, index: this.index })
    },
    removeItem() {
      this.$emit('remove', this.index);
    }
  }
}
</script>