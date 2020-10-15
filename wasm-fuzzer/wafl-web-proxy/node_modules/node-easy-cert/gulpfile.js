const gulp = require('gulp');
const babel = require('gulp-babel');

gulp.src('src/**/*.js')
  .pipe(babel({
    presets: [
      'es2015',
      'stage-0'
    ]
  }))
  .pipe(gulp.dest('dist'))
