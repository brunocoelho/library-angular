## Controllers

@ApplicationCtrl = ['$scope', 'User', ($scope, User) ->
  $scope.current_user = User.user()
]

@BookCtrl = ['$scope', 'Book', ($scope, Book) ->
  $scope.books = Book.query()

  $scope.borrow = ->

  $scope.return = ->
]
