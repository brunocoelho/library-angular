@BookCtrl = ($scope, $location, BookService, BookShareService, LoadingService, FilterBookService) ->

  fetchBooks = (startIndex) ->
    LoadingService.setLoading true
    BookService.index { startIndex: startIndex }, (books) ->
      $scope.books = books
      BookShareService.books = books
      LoadingService.setLoading false

  do ->
    if BookShareService.books.length isnt 0
      LoadingService.setLoading false
      $scope.books = BookShareService.books
      $scope.books
    else
      fetchBooks()

  $scope.viewBook = (book) ->
    BookShareService.book = book
    $location.path "books/#{book.id}"

  $scope.fetchPaginatedBooks = (startIndex) ->
    $scope.startIndex = startIndex
    fetchBooks(startIndex)
    window.scrollTo(0, 0)

  $scope.$on 'books', (event, books) ->
    books = FilterBookService.filter(books)
    $scope.books = books
    BookShareService.books = books
    LoadingService.setLoading false

@BookCtrl.$inject = ['$scope', '$location', 'BookService', 'BookShareService', 'LoadingService', 'FilterBookService']
