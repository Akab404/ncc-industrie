import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="trix-config"
export default class extends Controller {
  static targets = [ "editor"]
  connect() {

    Trix.config.blockAttributes.heading2 = {
      tagName: 'h2',
      terminal: true,
      breakOnReturn: true,
      group: false
    }
  }

  initialize() {
  const { toolbarElement } = this.editorTarget
  const h1Button = toolbarElement.querySelector("[data-trix-attribute=heading1]")
  h1Button.insertAdjacentHTML("afterend", `
    <button type="button" class="trix-button" data-trix-attribute="heading2" title="Heading 2" tabindex="-1" data-trix-active="">H2</button>
    <button type="button" class="trix-button" data-trix-attribute="heading3" title="Heading 3" tabindex="-1" data-trix-active="">H3</button>
  `)
  h1Button.classList.add("d-none")
}
}
