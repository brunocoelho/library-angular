## Controllers

@ApplicationCtrl = ['$scope', 'User', 'Book', ($scope, User, Book) ->
  console.log 'App up and running...'

  $scope.currentUser = User.user( ->
    if $scope.currentUser
      $scope.books = Book.index()
  )

  $scope.formatDate = (date) ->
    daysToReturn = 7
    newDate = new Date(date).getTime()
    formatedDate = new Date(daysToReturn * 24 * 60 * 60 * 1000 + newDate)
    formatedDate.toLocaleDateString()
]

@BookCtrl = ['$scope', '$location', 'Book', ($scope, $location, Book) ->

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

  $scope.editBook = (book) ->
    if $scope.currentUser
      $location.path "books/#{book.id}/edit"
]

@EditBookCtrl = ['$scope', '$location', '$routeParams', ($scope, $location, $routeParams) ->

  paramId = Number($routeParams.id)
  $scope.book = (book for book in $scope.books when book.id is paramId)[0]

  $scope.editBook = (book) ->
    # OPTIMIZE: Discover how to use default param '@id'.
    book.$update({ id: book.id })
    $location.path '/'
]
