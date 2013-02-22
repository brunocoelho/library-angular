## Directives

angular.module('dblclick', []).
  directive 'ng:dblclick', (expression, compiledElement) ->
	compiler = @
	(linkElement) ->
		scope = @
		linkElement.bind "dblclick", (event) ->
			scope.$apply(expression, linkElement);
			event.stopPropagation()
