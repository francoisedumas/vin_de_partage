import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = [ "item" ]
  static values = { url: String }

  delete(event) {
    event.preventDefault()

    fetch(this.urlValue, {
      method: "DELETE",
      headers: {
        "Accept": "application/json",
        "X-CSRF-Token": this.getToken()
      }
    })
      .then(this.itemTarget.remove())
  }

  getToken() {
    return document.querySelector("meta[name=csrf-token]").content;
  }
}
