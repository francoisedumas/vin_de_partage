import { Controller } from '@hotwired/stimulus';

export default class extends Controller {

  static targets = [ 'associations', 'template' ]

  addAssociation(event) {
    event.preventDefault();

    const content = this.templateTarget.innerHTML.replace(/CHILD_INDEX/g, new Date().getTime());
    this.associationsTarget.insertAdjacentHTML('beforeend', content);
  }

  removeAssociation(event) {
    event.preventDefault();

    const wrapper = event.target.closest('.nested-fields');
    wrapper.remove();
  }

}
