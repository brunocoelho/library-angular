@libraryApp.factory 'LocalStorageService', ->
  DEFAULT_QUERY = 'science'
  LOCAL_STORAGE_ITEM = 'queryLibraryAngular'

  {
  	getQuery: (query) ->
      if localStorage
        if query
          localStorage.setItem(LOCAL_STORAGE_ITEM, query)
          localStorage.getItem(LOCAL_STORAGE_ITEM)
        else
          if localStorage.getItem(LOCAL_STORAGE_ITEM)
          	localStorage.getItem(LOCAL_STORAGE_ITEM)
          else
            localStorage.setItem(LOCAL_STORAGE_ITEM, DEFAULT_QUERY)
            localStorage.getItem(LOCAL_STORAGE_ITEM)
      else
        if query
          query
        else
          DEFAULT_QUERY
  }
