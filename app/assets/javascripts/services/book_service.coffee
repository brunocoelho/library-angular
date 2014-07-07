angular.module('BookService', ['ngResource'])
  .factory 'Book', ['$resource', ($resource) ->
    $resource('books/:id', { id: '@id' },
      {
       'index': { method: 'GET', isArray: true }
      }
    )
  ]