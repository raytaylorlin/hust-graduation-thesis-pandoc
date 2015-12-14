var gulp = require('gulp');
var clean = require('gulp-clean');
var pandoc = require('gulp-pandoc');
var gutil = require('gulp-util');
var runSequence = require('run-sequence');

var childProcess = require('child_process');
var exec = childProcess.exec;
var execSync = childProcess.execSync;

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
    exec('pandoc -s --template=template/template.tex --chapters -o temp/thesis.tex src/thesis.md');
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
        'src/figures/**/*',
        'src/ref.bib'
    ], {base: 'src/'}).pipe(gulp.dest(DIR_TEMP));
});

gulp.task('pdf', function(cb) {
    process.chdir(DIR_TEMP);
    gutil.log('Executing xelatex thesis...');
    execSync('xelatex thesis');
    gutil.log('Executing bibtex thesis...');
    execSync('bibtex thesis');
    gutil.log('Executing xelatex thesis...');
    execSync('xelatex thesis');
    gutil.log('Executing xelatex thesis...');
    execSync('xelatex thesis');
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
        'pandoc-parts',
        'pandoc-thesis',
        ['copy-template', 'copy-src'],
        'pdf',
        'copy-pdf',
        cb
    );
});
