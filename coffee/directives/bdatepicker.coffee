# derictive for DateTimePicker for Bootstrap (http://eonasdan.github.io/bootstrap-datetimepicker/)
app.directive 'bdatetimepicker', ->
  restrict: "A"
  scope:
    ngDate: '='
  link: (scope, elem, attr, ctrl) ->
    dp = $(elem).datetimepicker().on 'change.dp', (e)->
      scope.$apply ->
        if e.date
          scope.ngDate = e.date._d
        else 
          scope.ngDate = null
