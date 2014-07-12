## Controllers

@ApplicationCtrl = ($scope, User, BookService, LoadingService, BookShareService) ->
  promise = User.user()
  promise.$promise.then (user) ->
    $scope.currentUser = user

  $scope.searchBooks = ->
    LoadingService.setLoading true
    BookService.index { q: $scope.query }, (books) ->
      $scope.$broadcast 'books', books

@ApplicationCtrl.$inject = ['$scope', 'User', 'BookService', 'LoadingService', 'BookShareService']
