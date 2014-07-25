module.exports = (grunt) ->

  grunt.initConfig {
    pkg: grunt.file.readJSON('package.json')


    # CSS auto-prefixing.
    autoprefixer:
      build:
        src: 'tmp/style.css'
        dest: 'build/css/style.css'


    # CoffeeScript compilation.
    coffee:
      build:
        options:
          sourceMap: true
          sourceMapDir: 'build/js/'
        files:
          'tmp/script.js' : 'src/js/script.coffee'


    # Copy SVG and favicon to build/img.
    copy:
      build:
        expand: true
        cwd: 'src/img'
        src: '*.{ico,svg}'
        dest: 'build/img'


    # Webserver.
    connect:
      server:
        options:
          port: 5000
          hostname: '*'
          base: 'build'
          livereload: true


    # Optimize images
    imagemin:
      files:
        expand: true
        cwd: 'src/img'
        src: ['**/*.{png,jpg,gif}']
        dest: 'build/img/'


    # Build HTML pages from tmplates.
    includes:
      files:
        src: ['src/*.html', '!src/_*.html']
        dest: 'build'
        flatten: true


    # SASS and Autoprefixer for CSS, and watcher.
    sass:
      build:
        options:
          style: 'compressed'
          sourcemap: true
        files:
          'tmp/style.css' : 'src/css/style.sass'


    # Concatenate and uglify JS.
    uglify:

      # Only run whenever these libraries are updated or added to.
      libraries:
        files:
          'src/js/lib.js' : [
            'bower_components/jquery/dist/jquery.js'
            'bower_components/jquery-visibility/jquery-visibility.js'
          ]

      # Run after changes to CoffeeScript file are JS-ified.
      build:
        files:
          'build/js/lib+script.js' : [
            'src/js/lib.js'
            'tmp/script.js'
          ]


   # Live processing.
    watch:
      autoprefixer:
        files: ['tmp/style.css']
        tasks: ['autoprefixer:style']

      coffee:
        files: ['src/js/script.coffee']
        tasks: ['coffee:build']

      copy:
        files: ['src/img/*.{ico,svg}']
        tasks: ['copy']

      html:
        files: ['src/*.html']
        tasks: ['includes']

      imagemin:
        files: ['src/img/*.{gif,jpg,png}']
        tasks: ['imagemin']

      livereload:
        files: ['build/css/style.css']
        options: { livereload: true }

      reload:
        files: [
          'build/*.html'
          'build/img/*'
          'build/js/*.js'
        ]
        options: { livereload: true }

      sass:
        files: [
          'src/css/*.sass'
          'src/css/*.scss'
        ]
        tasks: ['sass:build']

      uglify:
        files: ['tmp/script.js']
        tasks: ['uglify:build']


    # Push site to matthewmcvickar.com.
    'ftp-deploy':
      build:
        auth:
          host: 'matthewmcvickar.com',
          port: 21,
          authKey: 'primary'
        src: 'build',
        dest: 'public_html',
        exclusions: ['build/**/.DS_Store', '*.map']
  }

  require('load-grunt-tasks')(grunt)

  grunt.registerTask 'setup',   ['copy', 'includes', 'sass', 'autoprefixer', 'imagemin', 'uglify']
  grunt.registerTask 'default', ['setup', 'connect', 'watch']
  grunt.registerTask 'deploy',  ['ftp-deploy']
