<template>
  <div class="modal fade" :class="{ 'd-block show': dialog }" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Confirmation</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          {{ message }}
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" @click="cancel">No</button>
          <button type="button" class="btn btn-primary" @click="agree">Yes</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'confirmation-modal',
  props: {
    studentName: String,
    amount: String
  },
  data() {
    return {
      dialog: false,
      message: '',
      resolve: null,
      reject: null
    }
  },
  methods: {
    open(message) {
      this.dialog = true
      this.message = message
      return new Promise((resolve, reject) => {
        this.resolve = resolve
        this.reject = reject
      })
    },
    agree() {
      this.resolve(true)
      this.dialog = false
    },
    cancel() {
      this.resolve(false)
      this.dialog = false
    }
  }
}
</script>