module.exports = function(grunt) {

  // Load all Grunt tasks.
  require('load-grunt-tasks')(grunt);

  // Configure Grunt tasks.
  grunt.initConfig({

    // Remove the /_site build directory so we can start fresh.
    clean: {
      files: [
        '_site'
      ]
    },

    // Compile PostCSS to CSS.
    postcss: {
      options: {
        processors: [
          require('postcss-calc'),
          require('postcss-import'),
          require('postcss-mixins'),
          require('postcss-nesting'),
          require('postcss-simple-vars'),
          require('autoprefixer')({browsers: ['last 1 version']}),
          require('cssnano')
        ]
      },
      dist: {
        src: 'src/_assets/css/style.css',
        dest: '_site/css/style.css'
      }
    },

    // Optimize images.
    imagemin: {
      files: {
        expand: true,
        cwd: 'src/_assets/img',
        src: ['**/*.{png,jpg,gif,ico}'],
        dest: '_site/img/'
      },
      options: {
        progressive: true
      }
    },

    // BrowserSync.
    browserSync: {
      files: {
        src: ['_site/**/*']
      },
      options: {
        watchTask: true,
        server: {
          baseDir: '_site',
        },
        open: false,
        notify: false
      }
    },

    // Jekyll.
    jekyll: {
      build: {
        options: {
          src: 'src',
          dest: '_site'
        }
      }
    },

    // Live compilation.
    watch: {

      // Recompile stylesheet when CSS files change.
      postcss: {
        files: ['src/_assets/css/**/*.css'],
        tasks: ['postcss']
      },

      // Re-imagemin when images change.
      imagemin: {
        files: ['src/img/**/*.{gif,jpg,png}'],
        tasks: ['imagemin']
      },

      // Re-build Jekyll site and assets when HTML and text files change.
      jekyll: {
        files: ['src/**/*.{md,html,txt}', 'src/.htaccess'],
        tasks: ['build']
      },
    }
  });

  // Register Grunt tasks.
  grunt.registerTask(
    'build',
    [
      'clean',
      'jekyll',
      'postcss',
      'imagemin'
    ]
  );

  grunt.registerTask(
    'default',
    [
      'build',
      'browserSync',
      'watch'
    ]
  );

}
