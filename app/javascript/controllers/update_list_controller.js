import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['form', 'description', 'button', 'filter', 'three', 'six'];

  update(event) {
    event.preventDefault();
    let url = `${event.currentTarget.href}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
    .then(response => response.text())
    .then((data) => {
      this.descriptionTarget.outerHTML = data;
    })
  }
}
