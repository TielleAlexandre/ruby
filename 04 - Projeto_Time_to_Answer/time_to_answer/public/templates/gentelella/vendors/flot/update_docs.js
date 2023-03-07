/* jshint node: true*/

"use strict";

var literate = require('ljs');
var fs = require('fs');

var docs2generate = [
  ['docs/canvaswrapper.md', 'jquery_2.2.3.canvaswrapper.js'],
 // ['docs/colorhelpers.md', 'jquery_2.2.3.colorhelpers.js'],
  ['docs/absRelTime.md', 'jquery_2.2.3.flot.absRelTime.js'],
 // ['docs/axislabels.md', 'jquery_2.2.3.flot.axislabels.js'],
  ['docs/browser.md', 'jquery_2.2.3.flot.browser.js'],
  ['docs/composeImages.md', 'jquery_2.2.3.flot.composeImages.js'],
  ['docs/drawSeries.md', 'jquery_2.2.3.flot.drawSeries.js'],
  ['docs/hover.md', 'jquery_2.2.3.flot.hover.js'],
 // ['docs/legend.md', 'jquery_2.2.3.flot.legend.js'],
  ['docs/logaxis.md', 'jquery_2.2.3.flot.logaxis.js'],
  ['docs/navigate.md', 'jquery_2.2.3.flot.navigate.js'],
 // ['docs/selection.md', 'jquery_2.2.3.flot.selection.js'],
 // ['docs/symbol.md', 'jquery_2.2.3.flot.symbol.js'],
 // ['docs/touch.md', 'jquery_2.2.3.flot.touch.js'],
 // ['docs/touchNavigate.md', 'jquery_2.2.3.flot.touchNavigate.js'],
 // ['docs/uiConstants.md', 'jquery_2.2.3.flot.uiConstants.js']
];

docs2generate.forEach(function (doc) {
  console.log(doc[0], '...');
  var documentation = literate(doc[1], {
    code: false
  });

  fs.writeFileSync(doc[0], documentation);
});
