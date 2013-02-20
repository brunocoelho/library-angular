## Controllers

@AplicationCtrl = ['$scope', '$log', 'Book', ($scope, $log, Book) ->
    $scope.books = Book.query()

    $scope.borrow = ->

    $scope.return = ->

]
