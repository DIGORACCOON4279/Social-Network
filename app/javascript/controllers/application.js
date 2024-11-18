// import { Application } from "@hotwired/stimulus"

// const application = Application.start()

// // Configure Stimulus development experience
// application.debug = false
// window.Stimulus   = application

// export { application }

// app/javascript/application.js
import Rails from "rails-ujs";
import { Application } from "@hotwired/stimulus";

const application = Application.start();

// Inicia Stimulus
application.debug = false;
window.Stimulus = application;

// Inicia rails-ujs para manejar enlaces con método DELETE, PUT, PATCH
Rails.start();

export { application }
