import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['form', 'description', 'button'];

  update() {
    const url = `${this.formTarget.action}?query=${this.buttonTarget.value}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
    .then(response => response.text())
    .then((data) => {
      this.descriptionTarget.outerHTML = data;
    })
  }
}
