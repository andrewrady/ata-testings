document.addEventListener('turbolinks:load', function () {
  const navIcon = document.querySelector('.navbar-toggler');
  const menu = document.querySelector('.collapse');
  if(navIcon) {
    navIcon.addEventListener('click', () => {
      menu.classList.toggle('show');
    })
  }

  const nestedMenu = document.querySelectorAll('.dropdown-toggle');
  if(nestedMenu.length) {
    nestedMenu.forEach(menu => {
      const parent = menu.parentNode;
      const subMenu = Array.from(parent.children).find(x => Array.from(x.classList).includes('dropdown-menu'))
      parent.addEventListener('click', () => {
        subMenu.classList.toggle('d-none');
      })
    })
  }
});
