## Controllers

@AplicationCtrl = ['$scope', '$log', 'Book', 'Author', ($scope, $log, Book, Author) ->
    $scope.books = Book.query()
    $scope.authors = Author.query()

    #setTimeout(->
      #$scope.teste = Math.floor(Math.random() * 27)
      #2000)

    #setTimeout(->
      #alert(i)
      #2000) for i in [1,2,3,4]

]
