@EditBookCtrl = ['$scope', '$routeParams', 'Book', ($scope, $routeParams, Book) ->
  $scope.book = Book.get({ id: $routeParams.id })

  # $scope.editBook = ->
  #   $scope.book.$update()
  #   $scope.showEditSucess = true
]