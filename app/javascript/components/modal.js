import { loaderLg } from 'components/loader'

export default class Modal {
  #refresh
  #remoteId
  #remotePath
  #noBackground

  constructor(content, options = {}) {
    this.content = content
    this.#refresh = options.refresh || false
    this.#remoteId = options.remoteId
    this.#remotePath = options.remotePath
    this.#remotePath = options.remotePath
    this.#noBackground = options.noBackground || false
  }

  open() {
    if (!this.element || this.#refresh) {
      this.#build()
    }
    document.body.appendChild(this.element)
  }

  close() {
    setTimeout(() => this.element.remove())
  }

  #build() {
    if (this.#remoteId) {
      this.content = `
      <turbo-frame loading="lazy" id="${this.#remoteId}" src="${this.#remotePath}">
        <div class="p-10 flex justify-center items-center">${loaderLg}</div>
      </turbo-frame>
      `
    }

    this.element = this.#cloneTemplate()

    if (this.#noBackground) {
      const wrapper = this.element.querySelector('[data-modal="wrapper"]');

      ['bg-white', 'shadow-xl', 'px-4', 'pt-5', 'pb-4', 'sm:p-6']
        .forEach(cssClass => wrapper.classList.remove(cssClass))
    }

    this.#insertContent()

    // Listen for clicks on modal for elements having the data-modal="close" attribute
    // This is done this way so the content of the modal can be change, by turbo for example,
    // without having to add again some event listeners
    // This is pretty much the way some Rails-ujs events were catched
    this.element.addEventListener('click', ({ target }) => {
      // loop stops at most when reaching the modal element itself
      while (target !== this.element) {
        if (target.dataset.modal === "close") {
          return this.close()
        }

        target = target.parentElement
      }
    })
  }

  #cloneTemplate() {
    const modalTemplate = document.getElementById('modal-template')
    return modalTemplate.content.firstElementChild.cloneNode(true)
  }

  #insertContent() {
    const contentElement = this.element.querySelector('.modal-content')
    contentElement.innerHTML = this.content
  }
}
