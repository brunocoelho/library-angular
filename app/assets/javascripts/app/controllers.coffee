## Controllers

@AplicationCtrl = ['$scope', '$log', 'Book', 'Author', ($scope, $log, Book, Author) ->
    $scope.books = Book.query()
    $scope.authors = Author.query()

    $scope.borrow = ->

    $scope.return = ->

]
