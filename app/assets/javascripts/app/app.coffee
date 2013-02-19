## App

angular.module("LibraryApp", [])
  .config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
    $locationProvider.html5Mode(true).hashPrefix('!') # Deleting hashbang symbol '#' from url.
    $routeProvider
      .when("/",
        templateUrl: "/assets/books.html"
        controller: AplicationCtrl
      )
  ]
