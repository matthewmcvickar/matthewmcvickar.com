# [matthewmcvickar.com](http://matthewmcvickar.com)

My personal website.

## Setup

### Requirements

- NPM
- Grunt
- Bower

### Instructions

1. [Download this repo](https://github.com/matthewmcvickar/matthewmcvickar.com/archive/master.zip) or clone it.

2. Open a terminal window and navigate to the `matthewmcvickar.com` directory.

3. Install project dependencies:

    ```
    npm install
    ```

4. Fetch frontend JavaScript library dependencies with Bower:

    ```
    bower install
    ```

5. Run Grunt `setup` Grunt task, which concatenates and minifies the frontend libraries that Bower fetched:

    ```
    grunt setup
    ```

6. Start the default Grunt task, which starts a webserver, watches for changes in and builds JS and CSS files, and does autoreloads.

    ```
    grunt
    ```

  Make changes to files in the `src/` directory and they will be processed into the /build directory.

7. Go to [http://localhost:4141](http://localhost:4141/) to see the running site.
