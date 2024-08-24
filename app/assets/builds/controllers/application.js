"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.application = void 0;
var _stimulus = require("@hotwired/stimulus");
var application = exports.application = _stimulus.Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;