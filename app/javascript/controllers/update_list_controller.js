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
  flip(event) {
    console.log("hello")
    event.preventDefault();
    event.currentTarget.classList.add('trees')
    event.currentTarget.classList.remove('greendash1')
    event.currentTarget.querySelector('i').classList.remove('fa-burn')
    event.currentTarget.querySelector('i').classList.add('fa-tree')
    const poll = event.currentTarget.querySelector('p').innerHTML;
    event.currentTarget.querySelector('p').innerHTML = (poll * 2)
    event.currentTarget.querySelectorAll('p')[1].classList.add('d-none')
  }

}
