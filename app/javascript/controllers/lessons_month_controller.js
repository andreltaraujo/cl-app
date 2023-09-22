import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="lessons-month"
export default class extends Controller {
  connect() {
  }
	submit() {
		this.element.requestSubmit();
	}
}
