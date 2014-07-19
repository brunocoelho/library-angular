@BookCtrl = ($location, $rootScope, $scope, BookService, BookShareService, LoadingService, LocalStorageService) ->

  BOOKS_PER_PAGE = 40
  DEFAULT_IMAGE_URL = 'assets/default-book.jpg'

  fetchBooks = (startIndex, query) ->
    LoadingService.setLoading true
    BookService.index { startIndex: startIndex, q: query }, (books) ->
      $scope.books = books
      BookShareService.books = books
      LoadingService.setLoading false

  $scope.formatSaleability = (label) ->
    if label is 'NOT_FOR_SALE'
      'Not for sale'
    else if label is 'FOR_SALE'
      'For sale'
    else if label is 'FREE'
      'Free'
    else if label is 'FOR_SALE_AND_RENTAL'
      'For sale and rental'
    else
      label

  $scope.getAuthors = (authors) ->
    return if authors is null

    if authors.length > 1
      authors[0] + '...'
    else
      authors[0]

  $scope.getBookImage = (imageUrl) ->
    if imageUrl then imageUrl else DEFAULT_IMAGE_URL

  $scope.isBookForSale = (saleability) ->
    saleability is 'FOR_SALE'

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

@BookCtrl.$inject = ['$location', '$rootScope', '$scope', 'BookService', 'BookShareService', 'LoadingService', 'LocalStorageService']
