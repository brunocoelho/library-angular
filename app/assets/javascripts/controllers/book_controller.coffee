@BookCtrl = ['$scope', '$location', 'BookService', 'BookShareService', ($scope, $location, BookService, BookShareService) ->

  do ->
    if BookShareService.books.length isnt 0
      # Get cached books
      $scope.books = BookShareService.books
    else
      $scope.books = BookService.index ->
        BookShareService.books = $scope.books

  $scope.viewBook = (book) ->
    BookShareService.book = book
    $location.path "books/#{book.id}"
]