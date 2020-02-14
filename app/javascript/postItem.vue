<template>
  <div class="form-row">
    <div class="form-group col-md-5">
      <input type="text" class="form-control"  placeholder="name">
    </div>
    <div class="form-group col-md-2">
      <input type="text" class="form-control"  placeholder="price">
    </div>
    <div class="form-group col-md-2">
      <input type="text" class="form-control" placeholder="qunity">
    </div>
    <div class="form-group">
      <div class="form-check">
        <input class="form-check-input" type="checkbox">
        <label class="form-check-label">tax</label>
      </div>
    </div>
    <div class="form-group">
      <i class="fas fa-times" v-if="index"></i>
    </div>
  </div>
</template>

<script>
export default {
  name: 'pos-item',
  props: {
    item: Object,
    index: Number
  }
}
</script>