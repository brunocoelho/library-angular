## Controllers

@ApplicationCtrl = ['$scope', 'User', 'Book', ($scope, User, Book) ->
  console.log 'App up and running...'

  $scope.currentUser = User.user()

  $scope.formatDate = (date) ->
    daysToReturn = 7
    newDate = new Date(date).getTime()
    formatedDate = new Date(daysToReturn * 24 * 60 * 60 * 1000 + newDate)
    formatedDate.toLocaleDateString()
]

@BookCtrl = ['$scope', '$location', 'Book', ($scope, $location, Book) ->
  $scope.books = Book.index ->
    checkDate(book) for book in $scope.books unless $scope.currentUser.is_admin

  checkDate = (book) ->
    if book.user_id is $scope.currentUser.id
      lendingDate = new Date(book.lending_date).getTime()
      sevenDays = 7 * 24 * 60 * 60 * 1000
      today = new Date().getTime()
      if today - sevenDays > lendingDate
        renew = confirm "Você passou do prazo de devolver #{book.title}, deseja renovar este livro?"
        if renew
          book.lending_date = new Date().toLocaleString()
          book.$update()

  $scope.borrow = (id, index) ->
    book = $scope.books[index]
    book.user_id = $scope.currentUser.id
    book.lending_date = new Date().toLocaleString()
    book.$update()

  $scope.return = (id, title, index) ->
    answer = confirm "Tem certeza que deseja devolver #{title}?"

    if answer
      book = $scope.books[index]
      book.user_id = null
      book.lending_date = null
      book.$update()

  $scope.editBook = (book) ->
    if $scope.currentUser.is_admin
      $location.path "books/#{book.id}/edit"
]

@EditBookCtrl = ['$scope', '$location', '$routeParams', 'Book', ($scope, $location, $routeParams, Book) ->
  $scope.book = Book.get(id: $routeParams.id)

  $scope.editBook = ->
    $scope.book.$update()
    $scope.showEditSucess = true
]
