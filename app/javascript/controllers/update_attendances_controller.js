import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-attendances"
export default class extends Controller {
  connect() {
  }
	submit() {
		this.element.requestSubmit();
	}
}
