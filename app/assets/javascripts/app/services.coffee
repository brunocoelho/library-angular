## Services

angular.module('BookService', ['ngResource'])
  .factory 'Book', ['$resource', ($resource) ->
    $resource('books/:id', { id: '@id' },
      'update': { method: 'PUT' },
      'index': { method: 'GET', isArray: true }
    )
  ]

angular.module('UserService', ['ngResource'])
  .factory 'User', ['$resource', ($resource) ->
    $resource('user', {}, { 'user': { method: 'GET' } })
  ]
