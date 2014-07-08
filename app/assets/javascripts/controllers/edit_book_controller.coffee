@EditBookCtrl = ['$scope', '$routeParams', 'BookService', 'BookShareService', '$location', ($scope, $routeParams, BookService, BookShareService, $location) ->

  if BookShareService.book
	$scope.book = BookShareService.book
  else
	$scope.book = BookService.get({ id: $routeParams.id })

  $scope.showAllBooks = ->
	$location.path '/'

  # $scope.editBook = ->
  #   $scope.book.$update()
  #   $scope.showEditSucess = true
]