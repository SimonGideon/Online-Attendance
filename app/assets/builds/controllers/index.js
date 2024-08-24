"use strict";

var _application = require("controllers/application");
var _stimulusLoading = require("@hotwired/stimulus-loading");
// Import and register all your controllers from the importmap under controllers/*

// Eager load all controllers defined in the import map under controllers/**/*_controller

(0, _stimulusLoading.eagerLoadControllersFrom)("controllers", _application.application);

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)