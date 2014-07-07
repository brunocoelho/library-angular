@BookCtrl = ['$scope', '$location', 'Book', ($scope, $location, Book) ->
  $scope.books = Book.index ->
    for book in $scope.books
      book.status = getStatus(book)
      unless $scope.currentUser.is_admin
        checkDate(book)

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
    book.status = getStatus(book)
    book.$update()

  $scope.return = (id, title, index) ->
    answer = confirm "Tem certeza que deseja devolver #{title}?"

    if answer
      book = $scope.books[index]
      book.user_id = null
      book.lending_date = null
      book.status = getStatus(book)
      book.$update()

  $scope.editBook = (book) ->
    if $scope.currentUser.is_admin
      $location.path "books/#{book.id}"

  getStatus = (book) ->
    if book.user_id is null
      'Disponível'
    else if book.user_id isnt $scope.currentUser.id
       "Disponível em #{$scope.formatDate(book.lending_date)}"
    else
       "Retorne o livro em #{$scope.formatDate(book.lending_date)}"
]