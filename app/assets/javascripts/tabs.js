document.addEventListener('turbolinks:load', function () {

  let navigation = document.querySelector('.nav-tabs')
  let tabContent = document.querySelector('.tab-content')

  if(navigation && tabContent) {
    Array.from(navigation.children).forEach(x => {
      x.addEventListener('click', function(e) {
        e.preventDefault();
        Array.from(navigation.children).forEach(y => {
          let link = y.children[0];
          link.classList.remove('active')
        })
        Array.from(tabContent.children).forEach(content => {
          if(x.dataset.label && Array.from(content.classList).includes(x.dataset.label.toLowerCase())) {
            content.classList.add('active')
          } else {
            content.classList.remove('active')
          }
        })
        x.children[0].classList.add('active')
      })
    })
  }
});
