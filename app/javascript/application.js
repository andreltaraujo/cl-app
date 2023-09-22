// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import { Chart, registerables } from 'chart.js'
Chart.register(...registerables)

document.addEventListener('DOMContentLoaded', () => {
	const chartElement = document.getElementById("chartjs-7");
	const userSize = parseInt(chartElement.getAttribute('data-users-size'));
	const enrollSize = parseInt(chartElement.getAttribute('data-enroll-size'));
	new Chart(chartElement, {
		"type": "bar",
		"data": {
			"labels": ["June", "July", "August", "September"],
			"datasets": [{
					"label": "Matrículas Ativas",
					"data": [10, 20, 30, enrollSize],
					"borderColor": "rgb(255, 99, 132)",
					"backgroundColor": "rgba(255, 99, 132, 0.2)"
			}, {
					"label": "Usuários Cadastrados",
					"data": [10, 25, 30, userSize],
					"type": "line",
					"fill": false,
					"borderColor": "rgb(54, 162, 235)"
			}]
		},
	});
	new Chart(document.getElementById("chartjs-0"), {
		"type": "line",
		"data": {
			"labels": ["January", "February", "March", "April", "May", "June", "July"],
			"datasets": [{
				"label": "Views",
				"data": [65, 59, 80, 81, 56, 55, 40],
				"fill": false,
				"borderColor": "rgb(75, 192, 192)",
				"lineTension": 0.1
			}]
		},
	});
	new Chart(document.getElementById("chartjs-1"), {
		"type": "bar",
		"data": {
			"labels": ["January", "February", "March", "April", "May", "June", "July"],
			"datasets": [{
				"label": "Likes",
				"data": [65, 59, 80, 81, 56, 55, 40],
				"fill": false,
				"backgroundColor": ["rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)", "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(54, 162, 235, 0.2)", "rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)"],
				"borderColor": ["rgb(255, 99, 132)", "rgb(255, 159, 64)", "rgb(255, 205, 86)", "rgb(75, 192, 192)", "rgb(54, 162, 235)", "rgb(153, 102, 255)", "rgb(201, 203, 207)"],
				"borderWidth": 1
			}]
		},
	});
	new Chart(document.getElementById("chartjs-4"), {
		"type": "doughnut",
		"data": {
			"labels": ["P1", "P2", "P3"],
			"datasets": [{
				"label": "Issues",
				"data": [300, 50, 100],
				"backgroundColor": ["rgb(255, 99, 132)", "rgb(54, 162, 235)", "rgb(255, 205, 86)"]
			}]
		}
	});
});
