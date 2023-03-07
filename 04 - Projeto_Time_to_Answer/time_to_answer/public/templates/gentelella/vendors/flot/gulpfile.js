var gulp = require('gulp');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var babel = require('gulp-babel');
var filesExist = require('files-exist');
var maps = require('gulp-sourcemaps');
var gulpSequence = require('gulp-sequence');

var files = [
    './source/jquery_2.2.3.canvaswrapper.js',
    './source/jquery_2.2.3.colorhelpers.js',
    './source/jquery_2.2.3.flot.js',
    './source/jquery_2.2.3.flot.saturated.js',
    './source/jquery_2.2.3.flot.browser.js',
    './source/jquery_2.2.3.flot.drawSeries.js',
    './source/jquery_2.2.3.flot.errorbars.js',
    './source/jquery_2.2.3.flot.uiConstants.js',
    './source/jquery_2.2.3.flot.logaxis.js',
    './source/jquery_2.2.3.flot.symbol.js',
    './source/jquery_2.2.3.flot.flatdata.js',
    './source/jquery_2.2.3.flot.navigate.js',
    './source/jquery_2.2.3.flot.fillbetween.js',
    './source/jquery_2.2.3.flot.stack.js',
    './source/jquery_2.2.3.flot.touchNavigate.js',
    './source/jquery_2.2.3.flot.hover.js',
    './source/jquery_2.2.3.flot.touch.js',
    './source/jquery_2.2.3.flot.time.js',
    './source/jquery_2.2.3.flot.axislabels.js',
    './source/jquery_2.2.3.flot.selection.js',
    './source/jquery_2.2.3.flot.composeImages.js',
    './source/jquery_2.2.3.flot.legend.js'
];

gulp.task('build_flot_source', function() {
    return gulp.src(filesExist(files, { exceptionMessage: 'Missing file' }))
        .pipe(concat('jquery_2.2.3.flot.js'))
        .pipe(gulp.dest('dist/source'));
});

gulp.task('build_flot_minified', function() {
    return gulp.src(filesExist(files, { exceptionMessage: 'Missing file' }))
        .pipe(maps.init())
        .pipe(babel({
            "presets": [
                "@babel/preset-env"
            ]
        }))
        .pipe(concat('jquery_2.2.3.flot.js'))
        .pipe(uglify())
        .pipe(maps.write('./'))
        .pipe(gulp.dest('dist/es5'));
});

gulp.task('build', gulp.series('build_flot_source', 'build_flot_minified'));
