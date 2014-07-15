@BookCtrl = ($location, $rootScope, $scope, BookService, BookShareService, FilterBookService, LoadingService, LocalStorageService) ->

  fetchBooks = (startIndex, query) ->
    LoadingService.setLoading true
    BookService.index { startIndex: startIndex, q: query }, (books) ->
      $scope.books = books
      BookShareService.books = books
      LoadingService.setLoading false

  $scope.viewBook = (book) ->
    BookShareService.book = book
    $location.path "books/#{book.id}"

  $scope.fetchPaginatedBooks = (startIndex) ->
    $rootScope.startIndex = startIndex
    query = LocalStorageService.getQuery()
    fetchBooks(startIndex, query)
    window.scrollTo(0, 0)

  $scope.$on 'books', (event, books) ->
    books = FilterBookService.filter(books)
    $scope.books = books
    BookShareService.books = books
    LoadingService.setLoading false

  do ->
    if BookShareService.books.length isnt 0
      LoadingService.setLoading false
      $scope.books = BookShareService.books
      $scope.books
    else
      query = LocalStorageService.getQuery()
      fetchBooks(0, query)

@BookCtrl.$inject = ['$location', '$rootScope', '$scope', 'BookService', 'BookShareService', 'FilterBookService', 'LoadingService', 'LocalStorageService']
