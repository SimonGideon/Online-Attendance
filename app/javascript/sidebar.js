const expand_btn = document.querySelector(".expand-btn");
const open_menu = document.querySelector(".open-menu");
const close_menu = document.querySelector(".close-menu");
const sidebar = document.querySelector(".sidebar")


// mobile nav open 
open_menu.addEventListener("click", () => {
  open_menu.classList.toggle("hide-menu-btn");
  close_menu.classList.toggle("show")
  sidebar.classList.toggle("show")
  expand_btn.classList.toggle("hide-menu-btn")
});

close_menu.addEventListener("click", () => {
  open_menu.classList.remove("hide-menu-btn");
  close_menu.classList.remove("show");
  sidebar.classList.remove("show")
});

let activeIndex;

expand_btn.addEventListener("click", () => {
  document.body.classList.toggle("collapsed");
});

const current = window.location.href;

const allLinks = document.querySelectorAll(".sidebar-links a");

allLinks.forEach((elem) => {
  elem.addEventListener("click", function () {
    const hrefLinkClick = elem.href;

    allLinks.forEach((link) => {
      if (link.href == hrefLinkClick) {
        link.classList.add("active");
      } else {
        link.classList.remove("active");
      }
    });
  });
});