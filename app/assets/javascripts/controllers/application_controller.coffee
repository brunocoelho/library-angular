## Controllers

@ApplicationCtrl = ['$scope', 'User', ($scope, User) ->
  console.log 'App up and running...'

  $scope.currentUser = User.user()

  $scope.formatDate = (date) ->
    daysToReturn = 7
    newDate = new Date(date).getTime()
    formatedDate = new Date(daysToReturn * 24 * 60 * 60 * 1000 + newDate)
    formatedDate.toLocaleDateString()
]
