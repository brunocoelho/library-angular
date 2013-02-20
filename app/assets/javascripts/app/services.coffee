## Services

angular.module('BookService', ['ngResource'])
  .factory 'Book', ['$resource', ($resource) ->
    $resource('books/:id', {}, update: { method: 'PUT' })
  ]
