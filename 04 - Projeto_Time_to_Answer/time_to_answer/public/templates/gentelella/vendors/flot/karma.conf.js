// Karma configuration
// Generated on Wed Jun 15 2016 09:05:44 GMT-0500 (CDT)
/* eslint-disable */
var module;


module.exports = function(config) {
    'use strict';

    var browsersMatrix = {
            'win': ['Firefox', 'Chrome', 'Edge'],
            'linux': ['Firefox', 'Chrome'],
            'mac': ['Safari', 'Firefox', 'Chrome']
        },
        isWin = /^win/.test(process.platform),
        isLinux = /^linux/.test(process.platform),
        isMac = /^darwin/.test(process.platform),
        currentOSType = isWin ? 'win' : (isLinux ? 'linux' : 'mac'),
        currentOSBrowsers = browsersMatrix[currentOSType];

    var coverage_sources = [
        'source/jquery_2.2.3.colorhelpers.js',
        'source/jquery_2.2.3.canvaswrapper.js',
        'source/jquery_2.2.3.flot.js',
        'source/jquery_2.2.3.flot.saturated.js',
        'source/jquery_2.2.3.flot.browser.js',
        'source/jquery_2.2.3.flot.drawSeries.js',
        'source/jquery_2.2.3.flot.errorbars.js',
        'source/jquery_2.2.3.flot.uiConstants.js',
        'source/jquery_2.2.3.flot.logaxis.js',
        'source/jquery_2.2.3.flot.symbol.js',
        'source/jQuery.flot.errorbars.js',
        'source/jquery_2.2.3.flot.fillbetween.js',
        'source/jquery_2.2.3.flot.flatdata.js',
        'source/jquery_2.2.3.flot.navigate.js',
        'source/jquery_2.2.3.flot.stack.js',
        'source/jquery_2.2.3.flot.touchNavigate.js',
        'source/jquery_2.2.3.flot.touch.js',
        'source/jquery_2.2.3.flot.time.js',
        'source/jquery_2.2.3.flot.axislabels.js',
        'source/jquery_2.2.3.flot.composeImages.js',
        'source/jquery_2.2.3.flot.selection.js',
        'source/jquery_2.2.3.flot.legend.js',
        'source/jquery_2.2.3.flot.hover.js'
    ];

    var sources = [
        'source/jquery_2.2.3.js',
        'lib/globalize.js',
        'lib/globalize.culture.en-US.js',
        'lib/jquery_2.2.3.event.drag.js',
        'lib/jquery_2.2.3.mousewheel.js'
    ].concat(coverage_sources);

    var settings = {

        // base path that will be used to resolve all patterns (eg. files, exclude)
        basePath: '',

        // frameworks to use
        // available frameworks: https://npmjs.org/browse/keyword/karma-adapter
        frameworks: ['jasmine-jquery_2.2.3', 'jasmine'],

        // list of files / patterns to load in the browser
        files: sources.concat([
            'node_modules/webcharts-development-settings/testsUtils/*.js',
            { pattern: 'tests/svgstyle.css', included: true, served: true },
            'tests/*.Test.js'
        ]),

        // list of files to exclude
        exclude: [],

        // preprocess matching files before serving them to the browser
        // available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
        preprocessors: {
            '*.js': ['eslint'],
            'tests/**/*.js': ['eslint']
        },

        eslint: {
            stopOnError: config.stopOnEsLintError ? true : false,
            showWarnings: true,
            engine: {
                configFile: 'node_modules/webcharts-development-settings/.eslintrc.json',
                emitError: true,
                emitWarning: true
            }
        },

        // test results reporter to use
        // possible values: 'dots', 'progress'
        // available reporters: https://npmjs.org/browse/keyword/karma-reporter
        reporters: ['kjhtml', 'spec'],

        coverageReporter: {
            type: 'lcov', // lcov or lcovonly are required for generating lcov.info files
            dir: 'coverage/'
        },

        // web server port
        port: 9876,

        // enable / disable colors in the output (reporters and logs)
        colors: true,

        // level of logging
        // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
        logLevel: config.LOG_INFO,

        // enable / disable watching file and executing tests whenever any file changes
        autoWatch: true,

        // start these browsers
        // available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
        browsers: currentOSBrowsers,

        // Continuous Integration mode
        // if true, Karma captures browsers, runs the tests and exits
        singleRun: false,

        // Concurrency level
        // how many browsers should be started simultaneous
        concurrency: Infinity
    };

    if (config.coverage) {
        coverage_sources.forEach(function(pattern) {
            if (!settings.preprocessors[pattern]) {
                settings.preprocessors[pattern] = ['coverage'];
            } else {
                settings.preprocessors[pattern].push('coverage');
            }
        });

        settings.reporters.push('coverage');
        settings.reporters.push('coveralls');
        settings.browsers = ['Chrome'];
    }

    config.set(settings);
};
