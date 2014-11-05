window.app = angular.module('app', ['ngRoute', 'ui.bootstrap.modal'])
  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider.when '/general',
      templateUrl: 'templates/form.html'
      controller: MainCtrl

    $routeProvider.when '/actions',
      templateUrl: 'templates/form.html'
      controller: MainCtrl

    $routeProvider.when '/submit',
      templateUrl: 'templates/form.html'
      controller: MainCtrl

    $routeProvider.when '/results',
      templateUrl: 'templates/results.html'
      controller: ResultsCtrl

    $routeProvider.otherwise({redirectTo: '/general'})
]