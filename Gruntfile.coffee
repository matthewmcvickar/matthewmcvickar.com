module.exports = (grunt) ->

  grunt.initConfig {
    pkg: grunt.file.readJSON('package.json')

    # Copy the Bower-retrieved Normalize.css to a SCSS file that I can include in the source SASS.
    copy:
      single:
        files: [
          {
            src: ['bower_components/normalize-css/normalize.css']
            dest: 'src/css/_normalize.scss'
          }
        ]

    # SASS and Autoprefixer for CSS, and watcher.
    sass:
      build:
        files:
          'tmp/css/style.css' : 'src/css/style.sass'

    autoprefixer:
      single_file:
        src: 'tmp/css/style.css'
        dest: 'build/css/style.css'

    watch:
      sass:
        files: ['src/css/*.sass']
        tasks: ['sass:build']
      autoprefixer:
        files: ['tmp/css/style.css']
        tasks: ['autoprefixer:single_file']

    # Push site to matthewmcvickar.com.
    'ftp-deploy':
      build:
        auth:
          host: 'matthewmcvickar.com',
          port: 21,
          authKey: 'primary'
        src: 'build',
        dest: 'public_html',
        exclusions: ['build/**/.DS_Store']
  }

  require('load-grunt-tasks')(grunt)

  grunt.registerTask 'setup', ['copy']
  grunt.registerTask 'default', ['watch']
  grunt.registerTask 'deploy', ['ftp-deploy']
