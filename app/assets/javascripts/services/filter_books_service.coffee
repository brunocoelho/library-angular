@libraryApp.factory 'FilterBookService', ['$rootScope', ($rootScope) ->
  {
    filter: (books, scope = {}) ->
      books = (book for book in books when book.__proto__.constructor.toString().match(/Resource/))
      scope.totalBooksNumber = books.length
      books
  }
]