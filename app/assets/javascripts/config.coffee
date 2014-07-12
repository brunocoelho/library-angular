@libraryApp = angular.module 'libraryApp', ['ngResource', 'ngRoute', 'ngSanitize']

@libraryApp.config ['$routeProvider', '$httpProvider',
    ($routeProvider, $httpProvider) ->

      $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr 'content'

      $routeProvider
        .when('/',
          templateUrl: '/assets/books.html',
          controller: BookCtrl
        )
        .when('/books/:id',
          templateUrl: '/assets/book.html',
          controller: DetailBookCtrl
        )
        .otherwise(
          redirectTo: '/'
        )
  ]