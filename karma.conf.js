// Karma configuration
// Generated on Wed Jul 09 2014 14:25:03 GMT-0300 (BRT)

module.exports = function(config) {
  config.set({

    // base path, that will be used to resolve files and exclude
    basePath: '',


    // frameworks to use
    frameworks: ['jasmine'],


    // list of files / patterns to load in the browser
    files: [
        'http://code.jquery.com/jquery-1.11.0.min.js',
        'vendor/assets/javascripts/angular.js',
        'vendor/assets/javascripts/angular-route.js',
        'vendor/assets/javascripts/angular-mocks.js',
        'vendor/assets/javascripts/angular-resource.js',
        'vendor/assets/javascripts/angular-sanitize.js',
        'app/assets/javascripts/**/*.coffee',
        'test/javascripts/**/*.js'
    ],


    // list of files to exclude
    exclude: [
        'test/javascripts/e2e/**/*.js'
    ],


    // preprocess matching files before serving them to the browser
    // available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors: {
      'app/assets/javascripts/**/*.coffee': ['coffee']
    },


    // test results reporter to use
    // possible values: 'dots', 'progress', 'junit', 'growl', 'coverage'
    reporters: ['progress'],


    // web server port
    port: 9876,


    // enable / disable colors in the output (reporters and logs)
    colors: true,


    // level of logging
    // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO,


    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: true,


    // Start these browsers, currently available:
    // - Chrome
    // - ChromeCanary
    // - Firefox
    // - Opera (has to be installed with `npm install karma-opera-launcher`)
    // - Safari (only Mac; has to be installed with `npm install karma-safari-launcher`)
    // - PhantomJS
    // - IE (only Windows; has to be installed with `npm install karma-ie-launcher`)
    browsers: ['Chrome'],


    // If browser does not capture in given timeout [ms], kill it
    captureTimeout: 60000,


    // Continuous Integration mode
    // if true, it capture browsers, run tests and exit
    singleRun: false,
    plugins: [
        'karma-chrome-launcher',
        'karma-firefox-launcher',
        'karma-jasmine',
        'karma-coffee-preprocessor'
    ]
  });
};
