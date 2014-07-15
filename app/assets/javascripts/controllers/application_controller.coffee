## Controllers

@ApplicationCtrl = ($rootScope, $scope, BookService, BookShareService, LoadingService, LocalStorageService) ->

  $scope.searchBooks = ->
    LoadingService.setLoading true
    BookShareService.startIndex = 0
    startIndex = BookShareService.startIndex
    query = LocalStorageService.getQuery($scope.query)

    BookService.index { q: query, startIndex: startIndex }, (books) ->
      $scope.$broadcast 'books', books

@ApplicationCtrl.$inject = ['$rootScope', '$scope', 'BookService', 'BookShareService', 'LoadingService', 'LocalStorageService']
