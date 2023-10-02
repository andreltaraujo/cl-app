import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  conect() {
  }
	submit() {
		this.element.requestSubmit();
	}
}
