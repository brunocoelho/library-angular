@libraryApp.factory 'User', ['$resource', ($resource) ->
	$resource('user', {},
		{
			'user': { method: 'GET', headers: { 'Accept': 'application/json' } }
		}
	)
]
