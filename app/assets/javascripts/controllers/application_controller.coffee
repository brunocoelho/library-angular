## Controllers

@ApplicationCtrl = ($rootScope, $scope, BookService, BookShareService, LoadingService, LocalStorageService) ->

  $scope.searchBooks = ->
    startIndex = 0
    $rootScope.startIndex = startIndex
    LoadingService.setLoading true
    query = LocalStorageService.getQuery($scope.query)
    BookService.index { q: query, startIndex: startIndex }, (books) ->
      $scope.$broadcast 'books', books

@ApplicationCtrl.$inject = ['$rootScope', '$scope', 'BookService', 'BookShareService', 'LoadingService', 'LocalStorageService']
