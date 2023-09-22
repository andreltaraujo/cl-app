import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-attendances"
export default class extends Controller {
  connect() {
		console.log("Connected AddAttendances")
  }
	submit() {
		this.element.requestSubmit();
	}
}
