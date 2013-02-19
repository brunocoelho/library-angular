## App

angular.module('LibraryApp', ['BookService', 'AuthorService'])
  .config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
    $locationProvider.html5Mode(true).hashPrefix('!') # Deleting hashbang symbol '#' from url.
    $routeProvider
      .when('/',
        templateUrl: '/assets/books.html'
        controller: AplicationCtrl
      )
  ]
