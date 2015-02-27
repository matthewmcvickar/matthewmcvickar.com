module.exports = (grunt) ->

  grunt.initConfig {
    pkg: grunt.file.readJSON('package.json')

    # SASS and Autoprefixer for CSS, and watcher.
    sass:
      build:
        options:
          style: 'compressed'
        files:
          'tmp/style.css' : 'src/css/style.sass'

    # CSS auto-prefixing.
    autoprefixer:
      build:
        src: 'tmp/style.css'
        dest: 'build/css/style.css'

    # Optimize images
    imagemin:
      files:
        expand: true
        cwd: 'src/img'
        src: ['**/*.{png,jpg,gif}']
        dest: 'build/img/'

    # Concatenate and uglify JS.
    # uglify:
    #   files:
    #     'build/js/script.js' : [
    #       'bower_components/jquery/dist/jquery.js'
    #       'src/js/script.js'
    #     ]

    # Build HTML pages from templates.
    includes:
      files:
        src: ['src/*.html', '!src/_*.html']
        dest: 'build'
        flatten: true

    # Copy SVG and favicon to build/img.
    copy:
      htaccess:
        files:
          'build/.htaccess' : 'src/.htaccess'
      images:
        expand: true
        cwd: 'src/img'
        src: '*.{ico,svg}'
        dest: 'build/img'

    # Remove the /build directory so we can start fresh when building.
    clean:
      files: [
        'build'
        'tmp'
      ]

    # Live processing.
    watch:
      sass:
        files: [
          'src/css/*.sass'
          'src/css/*.scss'
        ]
        tasks: ['sass:build']

      autoprefixer:
        files: ['tmp/style.css']
        tasks: ['autoprefixer']

      imagemin:
        files: ['src/img/*.{gif,jpg,png}']
        tasks: ['imagemin']

      # uglify:
      #   files: ['js/script.js']
      #   tasks: ['uglify:build']

      html:
        files: ['src/*.html']
        tasks: ['includes']

      copy:
        files: ['src/img/*.{ico,svg}']
        tasks: ['copy']

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


    # Push site to matthewmcvickar.com.
    'ftp-deploy':
      build:
        auth:
          host: 'matthewmcvickar.com',
          port: 21,
          authKey: 'primary'
        src: 'build',
        dest: 'public_html',
        exclusions: ['.DS_Store', '*.map']
  }

  require('load-grunt-tasks')(grunt)

  grunt.registerTask 'setup',   ['clean', 'copy', 'includes', 'sass', 'autoprefixer', 'imagemin']
  grunt.registerTask 'default', ['setup', 'watch']
  grunt.registerTask 'deploy',  ['ftp-deploy']
