/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import "core-js/stable";
import "regenerator-runtime/runtime";
import './nav-header';
import './tabs';

document.addEventListener('DOMContentLoaded', () => {
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
  
    var customizeButton = document.getElementById('customize-categories');
  
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
})
