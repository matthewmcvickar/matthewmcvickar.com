module.exports = (grunt) ->

  # Load all Grunt tasks.
  require('jit-grunt')(grunt);

  # Configure Grunt tasks.
  grunt.initConfig {

    # Remove the /_site and /.tmp directories so we can start fresh.
    clean:
      files: [
        '_site'
        '.tmp'
      ]

    # Compile SASS to CSS and Autoprefix it.
    sass:
      build:
        files:
          '.tmp/style.css' : 'src/_assets/sass/style.scss'
        options:
          style: 'compressed'

    autoprefixer:
      build:
        src: '.tmp/style.css'
        dest: '_site/css/style.css'

    # Optimize images.
    imagemin:
      files:
        expand: true
        cwd: 'src/_assets/img'
        src: ['**/*.{png,jpg,gif,ico}']
        dest: '_site/img/'
      options:
        progressive: true

    # BrowserSync.
    browserSync:
      files:
        src: ['_site/**/*']
      options:
        watchTask: true
        server:
          baseDir: '_site',
        notify: {
          styles: [
            "z-index: 9999",
            "position: fixed",
            "left: 50%",
            "top: 0px",
            "transform: translate(-50%, 0)",
            "margin: 0",
            "padding: 10px 15px",
            "border-bottom-left-radius: 5px",
            "border-bottom-right-radius: 5px",
            "background-color: rgba(0, 0, 0, 0.5)",
            "color: white",
            "font-family: sans-serif",
            "font-size: 12px",
            "font-weight: bold",
            "text-align: center"
          ]
        }

    # Jekyll.
    jekyll:
      build:
        options:
          src: 'src'
          dest: '_site'

    # Live compilation.
    watch:
      # Recompile CSS when SASS files change.
      sass:
        files: ['src/_assets/sass/**/*.{scss}']
        tasks: ['sass']

      # Re-autoprefix CSS when the stylesheet is recompiled.
      autoprefixer:
        files: ['.tmp/style.css']
        tasks: ['autoprefixer']

      # Re-imagemin when images change. The `newer:` prefix only runs imagemin
      # on files that have modified since this task was last run.
      imagemin:
        files: ['src/img/**/*.{gif,jpg,png}']
        tasks: ['newer:imagemin']

      # Re-build Jekyll site and assets when HTML and text files change.
      jekyll:
        files: ['src/**/*.{md,html,txt}', 'src/.htaccess']
        tasks: ['build']

    # Push site to matthewmcvickar.com.
    'ftp-deploy':
      build:
        auth:
          host: 'matthewmcvickar.com',
          port: 21,
          authKey: 'primary'
        src: '_site',
        dest: 'public_html/matthewmcvickar.com/',
        exclusions: ['.DS_Store', '*.map']
  }

  # Register Grunt tasks.
  grunt.registerTask 'build', [
    'clean'
    'jekyll'
    'sass'
    'autoprefixer'
    'imagemin'
  ]

  grunt.registerTask 'default', [
    'build'
    'browserSync'
    'watch'
  ]

  grunt.registerTask 'deploy', [
    'ftp-deploy'
  ]
