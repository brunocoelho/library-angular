@libraryApp.factory 'BookService', ['$resource', ($resource) ->
	$resource('books/:id', { id: '@id' },
		{
			'index': { method: 'GET', isArray: true, headers: { 'Accept': 'application/json' } },
			'get': { method: 'GET', headers: { 'Accept': 'application/json' } }
		}
	)
]
