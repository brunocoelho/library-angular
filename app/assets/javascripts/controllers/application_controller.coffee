## Controllers

@ApplicationCtrl = ($scope, User, BookService, LoadingService, BookShareService, $location) ->

  $scope.searchBooks = ->
    LoadingService.setLoading true
    BookService.index { q: $scope.query }, (books) ->
      $scope.$broadcast 'books', books

@ApplicationCtrl.$inject = ['$scope', 'User', 'BookService', 'LoadingService', 'BookShareService', '$location']
