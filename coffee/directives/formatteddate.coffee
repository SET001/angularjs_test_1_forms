app.directive 'formatteddate', ($filter) ->
  link: (scope, element, attrs, ctrl) ->
    ctrl.$formatters.unshift (modelValue) ->
      return $filter('date')(modelValue, 'MM/dd/yyyy HH:mm a')

    ctrl.$parsers.unshift (viewValue) ->
      return $filter('date')(viewValue, 'MM/dd/yyyy HH:mm a')
  restrict: 'A',
  require: 'ngModel'