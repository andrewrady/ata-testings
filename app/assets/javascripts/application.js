// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

document.addEventListener('DOMContentLoaded', function () {
  
  document.querySelector('.add-student').addEventListener('click', function(e) {
    var text = this.innerHTML.trim()
    this.innerHTML = text == 'Add Student' ? 'Remove' : 'Add Student';
    this.classList.toggle('btn-primary');
    this.classList.toggle('btn-danger')
    document.getElementById('add-student-container').classList.toggle('d-none');
  })

  document.getElementById('customize-categories').addEventListener('click', function(e) {
    e.preventDefault();
    document.getElementById('categories').classList.toggle('d-none');
  })

  var categories = document.querySelectorAll('.form-check');
  for(var i = 0; i < categories.length; i++) {
    var checkbox = categories[i].firstChild.nextSibling;
    if(checkbox.value == 'f' || checkbox.value == 's' || checkbox.value == 'b')
      checkbox.checked = true;
  }
});