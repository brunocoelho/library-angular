@DetailBookCtrl = ($location, $routeParams, $scope, BookService, BookShareService, LocalStorageService) ->

  BOOK_NOT_FOUND = '404'

  totalBooksNumber = 0
  bookIndex = 0

  $scope.showAllBooks = ->
    $location.path '/'

  $scope.showNextBook = ->
    bookIndex += 1
    index = Math.abs bookIndex%totalBooksNumber
    $scope.similarBook = BookShareService.books[index]

  $scope.showPrevBook = ->
    bookIndex -= 1
    index = Math.abs bookIndex%totalBooksNumber
    $scope.similarBook = BookShareService.books[index]

  getAllBooksToCarousel = (book) ->
    $scope.book = book
    query = LocalStorageService.getQuery()
    BookService.index { q: query }, (books) ->
      BookShareService.books = books
      totalBooksNumber = books.length
      $scope.similarBook = books[0]

  if BookShareService.book
    $scope.book = BookShareService.book
    $scope.similarBook = BookShareService.books[0]
    totalBooksNumber = BookShareService.books.length
  else
    BookService.get { id: $routeParams.id }, (book) ->
      if book.code is BOOK_NOT_FOUND
        $scope.showAllBooks()
      else
        getAllBooksToCarousel(book)

@DetailBookCtrl.$inject = ['$location', '$routeParams', '$scope', 'BookService', 'BookShareService', 'LocalStorageService']
