## Controllers

@ApplicationCtrl = ['$scope', 'User', ($scope, User) ->
  $scope.current_user = User.user()
]

@BookCtrl = ['$scope', '$log', 'Book', ($scope, $log, Book) ->
  $scope.books = Book.index()

  $scope.borrow = (book_id, book_title)->
    answer = confirm "Tem certeza que deseja pegar emprestado #{book_title}?"

    if answer
      book = getBook(book_id)
      book.user_id = $scope.current_user.id
      # OPTIMIZE: Take a look at BookService to use defaul param '@id'
      book.$update({ id: book_id })

  $scope.return = (book_id, book_title) ->
    answer = confirm "Tem certeza que deseja devolver #{book_title}?"

    if answer
      book = getBook(book_id)
      book.user_id = null
      # OPTIMIZE: Take a look at BookService to use defaul param '@id'
      book.$update({ id: book_id })

  getBook = (book_id) ->
    Book.get({ id: book_id })
]
