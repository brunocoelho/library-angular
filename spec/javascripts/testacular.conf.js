basePath = '../../';

// list of files / patterns to load in the browser
//ANGULAR_SCENARIO,
//ANGULAR_SCENARIO_ADAPTER,
//'vendor/assets/javascripts/angular.min.js',
//'vendor/assets/javascripts/angular-*.js',
//'vendor/assets/javascripts/angular-mocks.js',
files = [
  JASMINE,
  JASMINE_ADAPTER,
  'vendor/assets/javascripts/angular.min.js',
  'vendor/assets/javascripts/angular-*.js',
  'spec/javascripts/*_spec.js'
];

// list of files to exclude
exclude = [];

// test results reporter to use
// possible values: 'dots', 'progress', 'junit'
reporters = ['progress'];

// web server port
port = 8080;

// cli runner port
runnerPort = 9100;

// enable / disable colors in the output (reporters and logs)
colors = true;

// level of logging
// possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
logLevel = LOG_INFO;

// enable / disable watching file and executing tests whenever any file changes
autoWatch = true;

// Start these browsers, currently available:
// - Chrome
// - ChromeCanary
// - Firefox
// - Opera
// - Safari (only Mac)
// - PhantomJS
// - IE (only Windows)
browsers = ['Firefox'];

// If browser does not capture in given timeout [ms], kill it
captureTimeout = 5000;

// Continuous Integration mode
// if true, it capture browsers, run tests and exit
singleRun = false;
