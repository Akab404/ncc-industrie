import { Controller } from "@hotwired/stimulus"

  // let lastScroll = 0;
// Connects to data-controller="sticky-nav"
export default class extends Controller {
  lastScroll = 0

  connect() {
    console.log("hello from stickynav controller");
  }

  scrollsticky() {
    const navbar = document.querySelector(".navbar");
    console.log(this.lastScroll);
    const currentScroll = window.scrollY;

    if (currentScroll <= 0 ) {
      navbar.classList.remove("scroll-up")
    }

    if (currentScroll > this.lastScroll && !navbar.classList.contains("scroll-down")) {
      navbar.classList.remove("scroll-up")
      navbar.classList.add("scroll-down")
    }

    if (currentScroll < this.lastScroll && navbar.classList.contains("scroll-down")) {
      navbar.classList.add("scroll-up")
      navbar.classList.remove("scroll-down")
    }

    this.lastScroll = currentScroll;
  }

}
