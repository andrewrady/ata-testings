document.addEventListener('turbolinks:load', function () {
  const navIcon = document.querySelector('.navbar-toggler');
  const menu = document.querySelector('.collapse');
  if(navIcon) {
    navIcon.addEventListener('click', function(e) {
      menu.classList.toggle('show')
      console.log(menu.classList)

    })
  }
});
