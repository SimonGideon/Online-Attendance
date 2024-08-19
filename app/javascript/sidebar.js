const expand_btn = document.querySelector(".expand-btn");
const open_menu = document.querySelector(".open-menu");
const close_menu = document.querySelector(".close-menu");
const sidebar = document.querySelector(".sidebar");

// mobile nav open
open_menu.addEventListener("click", () => {
  open_menu.classList.toggle("hide-menu-btn");
  close_menu.classList.toggle("show");
  sidebar.classList.toggle("show");
  expand_btn.classList.toggle("hide-menu-btn");
});

close_menu.addEventListener("click", () => {
  open_menu.classList.remove("hide-menu-btn");
  close_menu.classList.remove("show");
  sidebar.classList.remove("show");
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

document.addEventListener("DOMContentLoaded", function () {
  // Get the modal
  var modal = document.getElementById("logoutModal");

  // Get the button that opens the modal
  var btn = document.getElementById("logoutButton");

  // Get the <span> element that closes the modal
  var span = document.getElementsByClassName("close")[0];

  // When the user clicks the button, open the modal
  btn.onclick = function () {
    modal.style.display = "block";
  };

  // When the user clicks on <span> (x), close the modal
  span.onclick = function () {
    modal.style.display = "none";
  };

  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function (event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  };
});

document.addEventListener("turbolinks:load", function () {
  document.querySelectorAll(".sortable").forEach(function (element) {
    element.addEventListener("mouseover", function () {
      element.style.transition = "all 0.3s ease";
      element.style.color = "#007bff";
    });
    element.addEventListener("mouseout", function () {
      element.style.color = "";
    });
  });
});
