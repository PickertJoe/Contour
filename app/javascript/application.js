// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "bootstrap"
import "rfs"

window.Highcharts = require("highcharts/highcharts.js");
let exportingFactory = require("highcharts/modules/exporting.js");
exportingFactory(window.Highcharts);
