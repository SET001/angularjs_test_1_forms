// Generated by CoffeeScript 1.3.3
(function() {

  app.directive('bdatetimepicker', function() {
    return {
      restrict: "A",
      scope: {
        ngDate: '='
      },
      link: function(scope, elem, attr, ctrl) {
        var dp;
        return dp = $(elem).datetimepicker().on('change.dp', function(e) {
          return scope.$apply(function() {
            if (e.date) {
              return scope.ngDate = e.date._d;
            } else {
              return scope.ngDate = null;
            }
          });
        });
      }
    };
  });

}).call(this);
