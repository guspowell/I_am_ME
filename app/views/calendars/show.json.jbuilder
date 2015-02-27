json.name @calendar.name
json.start_date @calendar.start_date.strftime('%Y-%d-%m')
json.events @calendar.events.map {|event| event.id }
  

