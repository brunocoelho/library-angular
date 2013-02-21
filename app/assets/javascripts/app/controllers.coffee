## Controllers

@ApplicationCtrl = ['$scope', 'User', ($scope, User) ->
  console.log 'App up and running...'

  $scope.currentUser = User.user()

  $scope.formatDate = (date) ->
    daysToReturn = 7
    newDate = new Date(date).getTime()
    formatedDate = new Date(daysToReturn * 24 * 60 * 60 * 1000 + newDate)
    formatedDate.toLocaleDateString()
]

@BookCtrl = ['$scope', '$log', 'Book', ($scope, $log, Book) ->
  $scope.books = Book.index()

  $scope.borrow = (id, index) ->
    book = $scope.books[index]
    book.user_id = $scope.currentUser.id
    book.lending_date = new Date().toLocaleString()
    # OPTIMIZE: Discover how to use default param '@id'.
    book.$update({ id: id })

  $scope.return = (id, title, index) ->
    answer = confirm "Tem certeza que deseja devolver #{title}?"

    if answer
      book = $scope.books[index]
      book.user_id = null
      book.lending_date = null
      # OPTIMIZE: Discover how to use default param '@id'.
      book.$update({ id: id })
]
