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

window.addEventListener('load', function () {
  
  var reportTabs = this.document.querySelector('.reports-tabs')
  for(i=0; i < reportTabs.children.length; i++) {
    reportTabs.children[i].addEventListener('click', function(e) {
      e.preventDefault()
      toggleActiveTab(this)
      toggleReportsContainer(this.children[0].getAttribute('href').toLowerCase().substr(1))
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
  
})