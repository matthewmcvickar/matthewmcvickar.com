module.exports = (grunt) ->

  grunt.initConfig {
    pkg: grunt.file.readJSON('package.json')

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

  grunt.registerTask 'default', ['watch']
  grunt.registerTask 'deploy', ['ftp-deploy']
