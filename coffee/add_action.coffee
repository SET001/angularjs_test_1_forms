window.AddActionCtrl = ['$scope', '$modalInstance', 'action', (self, $modalInstance, action) ->
  self.action = _.clone action
  self.ok = ->
    $modalInstance.close self.action
  self.cancel = ->
    $modalInstance.dismiss 'cancel'
]