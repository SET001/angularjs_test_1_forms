window.ResultsCtrl = ['$scope', '$filter', (self, $filter) ->
  fields = []
  for field in self.fields
    value = self.incident.getValue(field.key)
    f = 
      name: field.label
    if typeof(value) is 'string'
      f.values = [value]
    else f.values = value
    fields.push f

  for action, i in self.incident.actions
    fields.push
      name: "Description of Corrective Action (#{i})"
      value: action.description
    fields.push
      name: "Action Taken By (name) (#{i})"
      value: action.name
    fields.push
      name: "Company (#{i})"
      value: action.company
    fields.push
      name: "Date (#{i})"
      value: action.date

  self.result = 
    workflowCreationInformation:
      workflowTypeName: "Incident Report"
      name: "Report - " + $filter('date')(new Date(), 'yyyy.MM.dd')
    workflowStepUpdateInformation:
      stepIdOrName: "Initial Step"
      fields: fields
]