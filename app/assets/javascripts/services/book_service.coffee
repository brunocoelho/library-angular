@libraryApp.factory 'BookService', ['$resource', ($resource) ->
	$resource('books/:id', { id: '@id' },
	  	{
	   		'index': { method: 'GET', isArray: true }
	  	}
	)
]
