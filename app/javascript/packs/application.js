// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "controllers";
import "bootstrap";
import "chartkick/chart.js";

// Internal imports, e.g:

import { loadDynamicBannerText } from '../components/banner';
import { counterUp } from "../components/counterup";
import { initCarousel } from "../components/carousel";
import { initForm } from "../components/form";
<<<<<<< HEAD
=======


>>>>>>> 203fe02d00debc87fa37d6f11e8714dcc0474791

document.addEventListener('turbolinks:load', () => {
  // Call your JS functions here
  // [...]
  loadDynamicBannerText();
  counterUp();
  initCarousel();
  initForm();
});
