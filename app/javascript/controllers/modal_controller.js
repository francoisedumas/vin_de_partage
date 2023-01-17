import { Controller } from "@hotwired/stimulus"
import Modal from 'components/modal'

// Connects to data-controller="modal"

// to use this modal component you just have do add the controller on the trigger element
// and provide the html with the data-modal-content-value attribute
// e.g:
//    <div data-controller="modal" data-action="click->modal#open" data-modal-content-value="<button> A button displayed in my modal</button>"></div>
// If you need that an element triggers the close of the modal, you just have to add data-modal="close" on it
// e.g:
//    <div data-controller="modal"
//         data-action="click->modal#open"
//         data-modal-content-value="
//      <button type="button"> This button will do nothing</button>
//      <button type="button" data-modal="close">This button will close the modal</button>
//    "></div>
//
// See ModalHelper#modal_with helper for usage in slim files
// Modal is usable without stimulus, see modal.js

export default class extends Controller {
  static values = {
    content: String,
    refresh: Boolean,
    remoteId: String,
    remotePath: String,
    noBackground: Boolean
  }

  connect() {
    this.modal = new Modal(this.contentValue, {
      refresh: this.refreshValue,
      remoteId: this.remoteIdValue,
      remotePath: this.remotePathValue,
      noBackground: this.noBackgroundValue
    })
  }

  open() {
    this.modal.open()
  }

  close() {
    this.modal.close()
  }
}
