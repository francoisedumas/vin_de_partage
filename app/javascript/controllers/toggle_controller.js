import { Controller } from '@hotwired/stimulus';

export default class extends Controller {

  static targets = ['content', 'tab', 'link'];
  static values = { class: String }

  toggle() {
    this.contentTargets.forEach( (content) => content.classList.toggle(this.classValue) );
  }

  display() {
    this.contentTargets.forEach( (content) => content.classList.remove(this.classValue) );
  }

  multipleToggle({ params: { id } }) {
    this.tabTargets.forEach( (tab, index) => {
      if (index === id) {
        tab.classList.remove(this.classValue);
      } else {
        tab.classList.add(this.classValue);
      }
    });

    if (this.linkTargets) {
      this.linkTargets.forEach( (link, index) => {
        if (index === id) {
          link.classList.add('active');
          link.classList.remove('btn-secondary');
          link.classList.add('btn-primary');
        } else {
          link.classList.remove('active');
          link.classList.add('btn-secondary');
          link.classList.remove('btn-primary');
        }
      });
    }
  }

}
