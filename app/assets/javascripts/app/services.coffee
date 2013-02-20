## Services

angular.module('BookService', ['ngResource'])
  .factory 'Book', ['$resource', ($resource) ->
    $resource('books/:id', {}, update: { method: 'PUT' })
  ]

angular.module('UserService', ['ngResource'])
  .factory 'User', ['$resource', ($resource) ->
    $resource('user', {}, { user: { method: 'GET' } })
  ]
