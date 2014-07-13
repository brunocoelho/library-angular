## Controllers

@ApplicationCtrl = ($rootScope, $scope, $location, User, BookService, LoadingService, BookShareService, LocalStorageService) ->

  $scope.searchBooks = ->
    startIndex = 0
    $rootScope.startIndex = startIndex
    LoadingService.setLoading true
    query = LocalStorageService.getQuery($scope.query)
    BookService.index { q: query, startIndex: startIndex }, (books) ->
      $scope.$broadcast 'books', books

@ApplicationCtrl.$inject = ['$rootScope', '$scope', '$location', 'User', 'BookService', 'LoadingService', 'BookShareService', 'LocalStorageService']
