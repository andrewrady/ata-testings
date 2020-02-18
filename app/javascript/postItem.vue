<template>
  <div class="form-row">
    <div class="form-group col-md-5">
      <input type="text" class="form-control"  placeholder="name">
      <template v-if="results.length">
        <div class="card rounded-0">
          <div class="card-body">
            This is some text within a card body.
          </div>
        </div>
        <div class="card rounded-0">
          <div class="card-body">
            This is some text within a card body.
          </div>
        </div>
      </template>
    </div>
    <div class="form-group col-md-3">
      <input type="text" class="form-control"  placeholder="price">
    </div>
    <div class="form-group col-md-">
      <input type="text" class="form-control" placeholder="quantity">
    </div>
    <div class="form-group">
      <div class="form-check">
        <input class="form-check-input" type="checkbox">
        <label class="form-check-label">tax</label>
      </div>
    </div>
    <div class="form-group mx-3">
      <i class="far fa-times-circle red close" v-if="index"></i>
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
      results: []
    }
  }
}
</script>