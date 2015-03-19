# [matthewmcvickar.com](http://matthewmcvickar.com)

My personal website.

## Setup

### Requirements

- NPM
- Grunt
- Bower

### Instructions

1. [Download this repository](https://github.com/matthewmcvickar/matthewmcvickar.com/archive/master.zip) or clone it.

1. Open a terminal window.

1. [Install Homebrew](http://brew.sh/) if you don't have it already.

1. Install NodeJS globally:

    ```sh
    brew install node
    ```

1. Install Grunt globally:

    ```sh
    $ npm install -g grunt-cli
    ```

1. Install Bower globally:

    ```sh
    $ npm install -g bower
    ```

1. Install the SASS gem globally:

    ```sh
    $ gem install sass
    ```

    (You may need to `sudo` this.)

1. Navigate to project folder.

1. Install project dependencies:

    ```sh
    $ npm install
    ```

1. Fetch frontend library dependencies with Bower:

    ```sh
    $ bower install
    ```

1. Start Grunt, which concatenates and minifies the frontend libraries that Bower fetched, then starts a webserver, then watches for changes in and builds JS and CSS files, and does autoreloads.

    ```sh
    $ grunt
    ```

    Make changes to files in the `src/` directory and they will be processed into the `/build` directory.

1. Go to [http://localhost:5000](http://localhost:5000) to see the running site.

1. ***Get started!***
