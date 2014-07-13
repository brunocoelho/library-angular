#LibraryApp

This app was created in order to use AngularJs with Rails.

You can take a look at the demo [here](http://library-angular.herokuapp.com/).


## Specs

* Ruby: 2.0.0-p0
* Rails: 3.2.12
* Development database: MySql
* Production database: PostgreSQL

## Setup

If you use rvm, create you own gemset and run bundle install:

`rvm --create --rvmrc use [RUBY_VERSION]@[GEMSET_NAME]`

`bundle install`

You should create the database and run the seed file to have the defaul user created properly:

`rake db:create`

`rake db:migrate`

`rake db:seed`

To startup, just run:

`rails server`

## Tests

To run the test suite properly you have to install [nodejs](http://nodejs.org/).

### Follow these steps to run e2e tests:

Use npm to install Protractor globally with:

`npm install -g protractor`

This will install two command line tools, `protractor` and `webdriver-manager`. Try running `protractor --version` to make sure it's working.

The `webdriver-manager` is a helper tool to easily get an instance of a Selenium Server running. Use it to download the necessary binaries with:

`webdriver-manager update`

Now start up a server with:

`webdriver-manager start`

This will start up a Selenium Server. Leave this server running, open another terminal window and run:

`protractor conf.js`

### Follow these steps to run unit tests:

To install the necessary packages run:

`npm install`

It will install all modules listed in `package.json` into `node_modules` in the current working directory.

In order to have `karma-cli` installed globally run:

`npm install -g karma-cli`

Now, you will be able to run `karma start` and see the unit tests running.

## Known bugs

### Production
* When the user search for a book, the first results are not displayed, only when the user clicks on a pagination link.
* In the principal page, if you click on a book to see the details, the similar books are not being displayed properly, only if the user goes to details book URL directly.


### Development
Up to now there's no bug reported on development environment.


## License

Library Angular is released under the [MIT License](http://www.opensource.org/licenses/MIT).
