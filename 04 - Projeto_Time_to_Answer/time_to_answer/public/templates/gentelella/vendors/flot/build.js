/* eslint-disable */

var args = process.argv.slice(2);
var fs = require('fs');
var concat = require('concat');
var tmp = require('tmp');

var distDir = './dist/es5';
var distFile = 'jquery_2.2.3.flot.js';

if (!fs.existsSync(distDir)) {
    fs.mkdirSync(distDir)
}

function concatenateFiles(destinationPath, callback) {
    concat([
        './jquery_2.2.3.colorhelpers.js',
        './jquery_2.2.3.canvaswrapper.js',
        './jquery_2.2.3.flot.js',
        './jquery_2.2.3.flot.saturated.js',
        './jquery_2.2.3.flot.browser.js',
        './jquery_2.2.3.flot.drawSeries.js',
        './jquery_2.2.3.flot.uiConstants.js',
        './jquery_2.2.3.flot.logaxis.js',
        './jquery_2.2.3.flot.symbol.js',
        './jquery_2.2.3.flot.flatdata.js',
        './jquery_2.2.3.flot.navigate.js',
        './jquery_2.2.3.flot.touchNavigate.js',
        './jquery_2.2.3.flot.hover.js',
        './jquery_2.2.3.flot.touch.js',
        './jquery_2.2.3.flot.time.js',
        './jquery_2.2.3.flot.axislabels.js',
        './jquery_2.2.3.flot.selection.js',
        './jquery_2.2.3.flot.composeImages.js',
        './jquery_2.2.3.flot.legend.js'
    ], destinationPath);
}

if (args[0] === 'test') {
    console.log('testing distribution ...');
    var tmpobj = tmp.fileSync();
    concatenateFiles(tmpobj.name, function(err, result) {
            var origBuild = fs.readFileSync(distDir + '/' + distFile, 'utf8');
            var newBuild = fs.readFileSync(tmpobj.name, 'utf8');

            if (newBuild !== origBuild) {
                console.log('The distribution file dist/es5/jquery_2.2.3.flot.js is not up to date. Type "npm run build" to fix it !');
                process.exitCode = 1;
                return;
            }

            console.log('Ok');
        });
    }  else {
        console.log('building ', distDir + '/' + distFile);
        concatenateFiles(distDir + '/' + distFile);
    }
