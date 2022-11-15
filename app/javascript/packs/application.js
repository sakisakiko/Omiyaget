// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"



import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"

import "../stylesheets/publics/sessions"

import "../stylesheets/publics/bookmarks"
import "../stylesheets/publics/customers"
import "../stylesheets/publics/post_items"
import "../stylesheets/publics/homes"




import '@fortawesome/fontawesome-free/js/all'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.$ = window.jQuery = require('jquery');
require('packs/raty')

const images = require.context('../images', true)
const imagePath = (name) => images(name, true)