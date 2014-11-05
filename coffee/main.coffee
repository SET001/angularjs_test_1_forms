window.MainCtrl = ['$scope', '$location', '$modal', (self, $location, $modal) ->
  self.tab = $location.path().replace /\//,''
  
  self.$watch 'incident.well_number', (well_name) ->
    
    if (well = _.find self.well_numbers, name:well_name)
      for key in ['state', 'region', 'office']
        self.incident[key] = well[key]

  self.$watch 'incident', (incident) ->
    localStorage['incident'] = JSON.stringify incident
  , yes

  self.toggle_severity = (severity) ->
    if severity in self.incident.severities
      self.incident.severities = _.without self.incident.severities, severity
    else self.incident.severities.push severity

  self.addAction = ->
    $modal.open
      templateUrl: 'templates/add_action.html'
      controller: 'AddActionCtrl'
      resolve:
        action: ->
          description: ''
          name: ''
          company: ''
          date: ''
    .result.then (action) ->
      if action
        self.incident.actions.push action

  self.editAction = (action) ->
    $modal.open
      templateUrl: 'templates/add_action.html'
      controller: 'AddActionCtrl'
      resolve:
        action: ->
          action
    .result.then (_action) ->
      if _action
        action = _.extend action, _action

  self.removeAction = (action) ->
    self.incident.actions = _.reject self.incident.actions, action

  self.submit = ->
    window.open '#/results'
]