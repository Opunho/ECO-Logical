import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['form', 'description', 'button','card1', 'card2'];

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
    if(event.currentTarget.classList.contains('greendash1')) {
      event.preventDefault();
      event.currentTarget.classList.add('trees')
      event.currentTarget.classList.remove('greendash1')
      event.currentTarget.querySelector('i').classList.remove('fa-burn')
      event.currentTarget.querySelector('i').classList.add('fa-tree')
      const poll = event.currentTarget.querySelector('p').innerHTML;
      event.currentTarget.querySelector('p').innerHTML=(poll * 2)
      event.currentTarget.querySelectorAll('p')[1].classList.add('d-none')
    }
    else {
      event.preventDefault();
      event.currentTarget.classList.remove('trees')
      event.currentTarget.classList.add('greendash1')
      event.currentTarget.querySelector('i').classList.add('fa-burn')
      event.currentTarget.querySelector('i').classList.remove('fa-tree')
      const poll = event.currentTarget.querySelector('p').innerHTML;
      event.currentTarget.querySelector('p').innerHTML=(poll / 2)
      event.currentTarget.querySelectorAll('p')[1].classList.remove('d-none')
    }
  }
}
