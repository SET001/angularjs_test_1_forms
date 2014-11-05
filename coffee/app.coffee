window.appCtrl = ['$rootScope', '$filter', (self, $filter) ->
  self.companies = ['Google', 'Blah-blah', 'IBM', 'HP']

  self.well_numbers = [
    name: 'Well-01'
    region: 'South'
    state: 'Oklahoma'
    office: 'Ringwood'
  ,
    name: 'Well-02'
    region: 'North'
    state: 'Montana'
    office: 'Sidney'
  ,
    name: 'Well-03'
    region: 'North'
    state: 'Dakota'
    office: 'Tioga'
  ]

  self.severities = ['Loss of well control', 'Fatality(ies)', 'Hospitalization or medical treatment', 'Spill offsite > 50 Bbls', 'Spill to water, any amount', 'Property damage']

  self.fields = [
    label: 'Date and Time of Incident'
    key: 'date'
    required: yes
  ,
    label: 'Reported By'
    key: 'reporter'
    required: yes
  ,
    label: 'Company of Reporter'
    key: 'reporter_company'
    required: yes
  ,
    label: 'Contact Number'
    key: 'contact'
    required: yes
  ,
    label: 'Supervisor Name'
    key: 'supervisor'
  ,
    label: 'High Level Description of Incident'
    key: 'description'
    required: yes
  ,
    label: 'Well Number'
    key: 'well_number'
    required: yes
  ,
    label: 'Region'
    key: 'region'
  ,
    label: 'State'
    key: 'state'
  ,
    label: 'Field Office'
    key: 'office'
  ,
    label: 'Incident Severity (Check all that Apply)'
    key: 'severities'
    required: yes
  ]

  stored = localStorage['incident']

  self.incident = 
    disale_severity: no
    reporter_company: ''
    severities: []
    actions: []
    isValid: ->
      for field in self.fields
        if field.required && !@[field.key]
          return no
      yes
    getValue: (key) ->
      if @[key]
        switch key
          when 'date' then return $filter('date')(@date, 'MM/dd/yyyy HH:mm a')
          else return @[key]

  stored = localStorage['incident']
  if stored
    self.incident = _.assign self.incident, $.parseJSON stored
  else
    console.log 'storage can not be used'
]