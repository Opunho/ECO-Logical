import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['homepage', 'newAccount' ];

  listen(event) {
    document.querySelector('.button-ghost-white').addEventListener('click', event => {
      this.homepageTarget.classList.add('d-none')
      this.newAccountTarget.classList.remove('d-none')
    })
  }
}
