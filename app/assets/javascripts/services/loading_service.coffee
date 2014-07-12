@libraryApp.factory 'LoadingService', ['$rootScope', ($rootScope) ->
  {
  	setLoading: (loading) ->
    	$rootScope.loadingView = loading
  }
]