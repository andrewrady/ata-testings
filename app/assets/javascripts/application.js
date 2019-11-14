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
//= require polyfill
//= require rails-ujs
//= require turbolinks
//= require_tree .

document.addEventListener('DOMContentLoaded', function () {
  
  var addStudent = document.querySelector('.add-student')  
  
  if(addStudent) {
    addStudent.addEventListener('click', function(e) {
      var text = this.innerHTML.trim()
      this.innerHTML = text == 'Add Student' ? 'Remove' : 'Add Student';
      this.classList.toggle('btn-primary');
      this.classList.toggle('btn-danger')
      document.getElementById('add-student-container').classList.toggle('d-none');
    })
  }

  var customizeButton = document.getElementById('customize-categories')

  if(customizeButton) {
    customizeButton.addEventListener('click', function(e) {
      e.preventDefault();
      document.getElementById('categories').classList.toggle('d-none');
    })
  }

  var categories = document.querySelectorAll('.form-check');
  for(var i = 0; i < categories.length; i++) {
    var checkbox = categories[i].firstChild.nextSibling;
    if(checkbox.value == 'f' || checkbox.value == 's' || checkbox.value == 'b')
      checkbox.checked = true;
  }
 
  var reportTabs = document.querySelector('.reports-tabs')
  if(reportTabs) {
    for(i=0; i < reportTabs.children.length; i++) {
      reportTabs.children[i].addEventListener('click', function(e) {
        e.preventDefault()
        toggleActiveTab(this)
        toggleReportsContainer(this.children[0].getAttribute('href').toLowerCase().substr(1))
      })
    }
  }

  var printButton = document.querySelector('.print-reports')
  if(printButton) {
    printButton.addEventListener('click', function() {
      var nextTab = reportTabs.children[1]
      toggleActiveTab(nextTab)
      toggleReportsContainer('next')
      window.print()
    })
  }

  function toggleActiveTab(tab) {
    for(var sibling of tab.parentNode.children) {
      if(sibling !== tab) sibling.children[0].classList.remove('active')
    }
    tab.children[0].classList.add('active')
  }

  function toggleReportsContainer(value) {
    var reportsContent = document.querySelector('.reports-container')
    for(i=0; i < reportsContent.children.length; i++) {
      if(reportsContent.children[i].id == value) {
        reportsContent.children[i].classList.add('active')
        reportsContent.children[i].classList.add('show')
      } else {
        reportsContent.children[i].classList.remove('active')
        reportsContent.children[i].classList.remove('show')
      }
    }
  }
});
