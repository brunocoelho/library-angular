@DetailBookCtrl = ($scope, $routeParams, BookService, BookShareService, FilterBookService, $location, $resource) ->

  $scope.totalBooksNumber = 0
  bookIndex = 0

  $scope.showAllBooks = ->
    $location.path '/'

  $scope.showNextBook = ->
    bookIndex += 1
    index = Math.abs bookIndex%$scope.totalBooksNumber
    $scope.similarBook = BookShareService.books[index]

  $scope.showPrevBook = ->
    bookIndex -= 1
    index = Math.abs bookIndex%$scope.totalBooksNumber
    $scope.similarBook = BookShareService.books[index]

  if BookShareService.book
    $scope.book = BookShareService.book
    BookShareService.books = FilterBookService.filter(BookShareService.books, $scope)
    $scope.similarBook = BookShareService.books[0]
  else
    BookService.get { id: $routeParams.id }, (book) ->
      $scope.book = book
      BookService.index (books) ->
        BookShareService.books = FilterBookService.filter(books, $scope)
        $scope.similarBook = books[0]

@DetailBookCtrl.$inject = ['$scope', '$routeParams', 'BookService', 'BookShareService', 'FilterBookService', '$location', '$resource']
