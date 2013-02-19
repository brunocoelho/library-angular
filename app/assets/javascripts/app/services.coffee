## Services

angular.module('BookService', ['ngResource'])
  .factory 'Book', ['$resource', ($resource) ->
    $resource('books/:id', {}, update: { method: 'PUT' })
  ]

angular.module('AuthorService', ['ngResource'])
  .factory 'Author', ['$resource', ($resource) ->
    $resource('authors/:id', {}, update: { method: 'PUT' })
  ]
