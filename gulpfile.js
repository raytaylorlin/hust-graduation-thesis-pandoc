var gulp = require('gulp');
var clean = require('gulp-clean');
var pandoc = require('gulp-pandoc');
var replace = require('gulp-replace');
var rename = require('gulp-rename');
var gutil = require('gulp-util');
var runSequence = require('run-sequence');

var childProcess = require('child_process');
var exec = childProcess.exec;
var execSync = childProcess.execSync;
var argv = require('yargs').argv;

var DIR_TEMP = 'temp/';
var DIR_DIST = 'dist/';

gulp.task('pandoc-parts', function() {
    return gulp.src(['src/*.md', '!src/thesis.md'])
        .pipe(pandoc({
            from: 'markdown',
            to: 'latex',
            ext: '.tex',
            args: ['--chapters']
        }))
        .pipe(gulp.dest(DIR_TEMP));
});

gulp.task('pandoc-thesis', function(cb) {
    var util = require('util');
    var cmd = 'pandoc -s --template=template/template.tex --chapters -o temp/thesis_pre.tex src/%s';
    var finalCmd = util.format(cmd, argv.thesis || 'thesis.md');
    gutil.log('Executing:', gutil.colors.blue(finalCmd));
    exec(finalCmd);
    // 让gulp知道任务到此已完成
    cb();
});

gulp.task('copy-template', function() {
    return gulp.src([
        'template/hustthesis.bst',
        'template/hustthesis.cls',
        'template/hust-title.eps',
        'template/hust-title.pdf'
    ]).pipe(gulp.dest(DIR_TEMP));
});

gulp.task('copy-src', function() {
    return gulp.src([
        'src/*.tex',
        'src/figures/**/*',
        'src/ref.bib'
    ], {base: 'src/'}).pipe(gulp.dest(DIR_TEMP));
});

gulp.task('pre', function() {
    return gulp.src('temp/thesis_pre.tex')
        .pipe(replace('\\includegraphics{', '\\includegraphics[width=\\maxwidth]{'))
        .pipe(rename('thesis.tex'))
        .pipe(gulp.dest(DIR_TEMP));
});

gulp.task('pdf', function(cb) {
    // var latexCmd = 'xelatex thesis';
    var latexCmd = argv.lualatex ? 'lualatex thesis' : 'xelatex thesis';
    var bibtexCmd = 'bibtex thesis';

    process.chdir(DIR_TEMP);
    gutil.log('Executing:', gutil.colors.blue(latexCmd));
    execSync(latexCmd);
    gutil.log('Executing:', gutil.colors.blue(bibtexCmd));
    execSync(bibtexCmd);
    gutil.log('Executing:', gutil.colors.blue(latexCmd));
    execSync(latexCmd);
    gutil.log('Executing:', gutil.colors.blue(latexCmd));
    execSync(latexCmd);
    process.chdir('../');

    // 让gulp知道任务到此已完成
    cb();
});

gulp.task('copy-pdf', function() {
    return gulp.src('temp/thesis.pdf')
        .pipe(gulp.dest(DIR_DIST));
});

gulp.task('clean', function() {
    return gulp.src(DIR_TEMP, {read: false})
        .pipe(clean());
});

gulp.task('default', function(cb) {
    runSequence(
        // 'clean',
        // 'pandoc-parts',
        'pandoc-thesis',
        ['copy-template', 'copy-src'],
        'pre',
        'pdf',
        'copy-pdf',
        cb
    );
});
