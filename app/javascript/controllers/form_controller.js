import { Controller } from "@hotwired/stimulus";

// Connectez ce controller aux éléments HTML.
export default class extends Controller {
  connect() {
    // Initialisez Splide lorsque le controller est monté.
    this.splide = new Splide(this.element, {
      type:'loop',
      perPage:4,
      focus:0,
      arrows : false,
      pagination : false,
      autoplay : true,
      pauseOnHover : false,
      speed : 500,
      gap : "8%",
      interval : 1250,
      breakpoints : {
        1400:{
          perPage:3,
        },
        991:{
          perPage:2,
        },
      }
    });

    this.splide.mount();

  }

  disconnect() {
    // Détruisez Splide lorsque le controller est démonté.
    if (this.splide) {
      this.splide.destroy();
    }
  }
}
