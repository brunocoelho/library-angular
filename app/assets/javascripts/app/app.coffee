## App

angular.module('LibraryApp', ['BookService', 'UserService'])
  .config ['$routeProvider', '$locationProvider', '$httpProvider',
    ($routeProvider, $locationProvider, $httpProvider) ->
      $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr 'content'
      $locationProvider.html5Mode(true).hashPrefix('!') # Deleting hashbang symbol '#' from url.
      $routeProvider
        .when('/',
          templateUrl: '/assets/books.html'
          controller: BookCtrl
        )
  ]
