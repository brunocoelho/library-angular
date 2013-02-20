## Controllers

@ApplicationCtrl = ['$scope', '$log', 'User', ($scope, $log, User) ->
  $scope.current_user = User.user()

  $scope.formatDate = (date) ->
    daysToReturn = 7
    newDate = new Date(date).getTime()
    formatedDate = new Date(daysToReturn * 24 * 60 * 60 * 1000 + newDate)
    formatedDate = "#{formatedDate.getDate()}/#{formatedDate.getMonth() + 1}/#{formatedDate.getFullYear()}"
]

@BookCtrl = ['$scope', '$log', 'Book', ($scope, $log, Book) ->
  $scope.books = Book.index()

  $scope.borrow = (book_id, book_title)->
    answer = confirm "Tem certeza que deseja pegar emprestado #{book_title}?"

    if answer
      book = getBook(book_id)
      book.user_id = $scope.current_user.id
      book.lending_date = new Date().toLocaleString()
      # OPTIMIZE: Take a look at BookService to use defaul param '@id'
      book.$update({ id: book_id })

  $scope.return = (book_id, book_title) ->
    answer = confirm "Tem certeza que deseja devolver #{book_title}?"

    if answer
      book = getBook(book_id)
      book.user_id = null
      book.lending_date = null
      # OPTIMIZE: Take a look at BookService to use defaul param '@id'
      book.$update({ id: book_id })

  getBook = (book_id) ->
    Book.get({ id: book_id })
]
