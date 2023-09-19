import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = ["project_id", "ceic_id", "classroom_id"]
	
	connect () {
		this.fetchSchedules();
		}
		fetchSchedules() {
			const project_id = this.project_idTarget.value;
			const ceic_id = this.ceic_idTarget.value;
			const url = '/backoffice/classrooms'
			fetch(`${url}?project_id=${project_id}&ceic_id=${ceic_id}`, {
				method: "GET",
				headers: {
					"Content-Type": "application/json",
					Accept: "application/json",
				},
			})
			.then((response) => response.json())
			.then((data) => {
				this.classroom_idTarget.innerHTML = "";
				for (const [id, schedule] of Object.entries(data)) {
					const option = document.createElement("option");
					option.value = id;
					option.text = schedule;
					this.classroom_idTarget.appendChild(option);
				}
			});
		}
	}
	