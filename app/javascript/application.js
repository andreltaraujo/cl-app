// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import Inputmask from 'inputmask';

document.addEventListener("DOMContentLoaded", function() {
  document.addEventListener("change", function(event) {
    const target = event.target;
		if (target.classList.contains('.phone-field')) {
			console.log(target)
    	const inputmask = new Inputmask('(99) 99999-9999');
    	inputmask.mask(target);
  	}
	});
});