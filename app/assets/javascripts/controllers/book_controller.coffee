@BookCtrl = ($location, $rootScope, $scope, BookService, BookShareService, FilterBookService, LoadingService, LocalStorageService) ->

  BOOKS_PER_PAGE = 40
  DEFAULT_IMAGE_URL = 'assets/default-book.jpg'

  fetchBooks = (startIndex, query) ->
    LoadingService.setLoading true
    BookService.index { startIndex: startIndex, q: query }, (books) ->
      $scope.books = books
      BookShareService.books = books
      LoadingService.setLoading false

  $scope.getBookImage = (imageUrl) ->
    if imageUrl then imageUrl else DEFAULT_IMAGE_URL

  $scope.viewBook = (book) ->
    BookShareService.book = book
    $location.path "books/#{book.id}"

  $scope.shouldShowPrevArrow = ->
    BookShareService.startIndex isnt 0

  $scope.fetchBooks = (direction) ->
    return if direction is 'prev' and BookShareService.startIndex is 0
    BookShareService.startIndex += BOOKS_PER_PAGE if direction is 'next'
    BookShareService.startIndex -= BOOKS_PER_PAGE if direction is 'prev'

    startIndex = BookShareService.startIndex
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
