module.exports = (grunt) ->

  grunt.initConfig {
    pkg: grunt.file.readJSON('package.json')

    # Concatenate and uglify JS libraries. Only run whenever these librarise are updated or added to.
    uglify:
      build:
        files:
          'build/js/lib.js' : [
            'bower_components/jquery/dist/jquery.js'
            'bower_components/jquery-visibility/jquery-visibility.js'
          ]

    # Build HTML pages from templates.
    includes:
      files:
        src: [
          'src/**/*.html'
          '!src/_*.html'
          ]
        dest: 'build'
        flatten: true
        options:
          filenamePrefix: '_'
          filenameSuffix: '.html'

    # CoffeeScript.
    coffee:
      build:
        files:
          'build/js/script.js' : 'src/js/script.coffee'
        options:
          sourceMap: true
          sourceMapDir: 'build/js/'

    # SASS and Autoprefixer for CSS.
    sass:
      build:
        files:
          'tmp/css/style.css' : 'src/css/style.sass'
        options:
          sourcemap: true

    autoprefixer:
      single_file:
        src: 'tmp/css/style.css'
        dest: 'build/css/style.css'

    # Webserver.
    connect:
      server:
        options:
          port: 5000
          hostname: '*'
          base: 'build'
          livereload: true

    # Live processing.
    watch:
      html:
        files: ['src/**/*.html']
        tasks: ['includes']
      coffee:
        files: ['src/js/script.coffee']
        tasks: ['coffee:build']
      sass:
        files: ['src/css/*.sass']
        tasks: ['sass:build']
      autoprefixer:
        files: ['tmp/css/style.css']
        tasks: ['autoprefixer:single_file']
      reload:
        files: ['build/*.html','build/js/script.js']
        options: {livereload: true}
      livereload:
        files: ['build/css/style.css']
        options: {livereload: true}


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

  grunt.registerTask 'setup', ['uglify']
  grunt.registerTask 'default', ['connect', 'watch']
  grunt.registerTask 'deploy', ['ftp-deploy']
