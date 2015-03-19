# [matthewmcvickar.com](http://matthewmcvickar.com)

My personal website.


## Environment

This site is generated by [Jekyll](http://jekyllrb.com/), a static site generator. The development tasks are run by [Grunt](http://gruntjs.com/).


## Setup Instructions

1. [Download the repository](https://github.com/matthewmcvickar/matthewmcvickar.com/archive/master.zip) or clone it to your computer with Git. Put it wherever you put websites that you work on locally (I like `~/Sites/`).

1. [Install Homebrew](http://brew.sh/) if you don't have it already.

1. Open a terminal window.

1. Install NodeJS:

    ```sh
    $ brew install node
    ```

1. Install Grunt:

    ```sh
    $ npm install -g grunt-cli
    ```

1. Install Bower:

    ```sh
    $ npm install -g bower
    ```

1. Navigate to the root folder of this project, wherever you put it in step 1 (`~/Sites/matthewmcvickar.com/`, perhaps?).

1. Use Bundler to install Jekyll and other required Ruby gems:

    - `jekyll`
    - `jekyll-redirect-from` (for URL redirects)
    - `sass`

    Run:

    ```sh
    $ bundle install
    ```
    (These are read from the `Gemfile` file in the project root.)

1. Use the NodeJS Package Manage to install development dependencies:

    ```sh
    $ npm install
    ```

    (These are read from the `package.json` file in the project root.)

1. Fetch frontend library dependencies with Bower:

    ```sh
    $ bower install
    ```

    (These are read from the `bower.json` file in the project root.)

1. Start Grunt.

    ```sh
    $ grunt
    ```

    (This runs the `default` Grunt task, which is configured in the `Gruntfile` file in the project root.)

    Grunt cleans up old files, runs the `jekyll build` command to build the static site, compiles SASS to CSS and autoprefixes it, minifies images, and then watches over your files to re-build and recompile as necessary. 

    BrowserSync will automatically open a window to [localhost:3000](http://localhost:3000) when this startup process is done starting up. BrowserSync automatically reloads the browser when files change, and injects CSS changes without reloading. It also mirrors scrolling and clicking across devices, so you can go to [localhost:3000](http://localhost:3000) on your phone and control both your computer and phone simultaneously.

1. To make changes, change files in the `/src/` directory. They will be processed by Grunt and Jekyll and placed into the `/_site/` directory.

    **IMPORTANT: Do not make any changes to the `/_site/` directory or its contents. The `/_site/` directory will be blown away every time Jekyll rebuilds the site.**
