import { Toast } from "bootstrap";

// Wait for the DOM to be fully loaded
document.addEventListener("DOMContentLoaded", () => {
  // Find all toast elements
  const toastElements = document.querySelectorAll(".toast");
  // Initialize each toast
  toastElements.forEach((toastElement) => {
    const toast = new Toast(toastElement);
    toast.show();
  });
});
