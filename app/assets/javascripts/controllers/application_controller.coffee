## Controllers

@ApplicationCtrl = ($rootScope, $scope, $location, User, BookService, LoadingService, BookShareService, LocalStorageService) ->

  $scope.searchBooks = ->
    $rootScope.startIndex = 0
    LoadingService.setLoading true
    query = LocalStorageService.getQuery($scope.query)
    BookService.index { q: query }, (books) ->
      $scope.$broadcast 'books', books

@ApplicationCtrl.$inject = ['$rootScope', '$scope', '$location', 'User', 'BookService', 'LoadingService', 'BookShareService', 'LocalStorageService']
