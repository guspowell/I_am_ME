json.array!(@calendar) do |calendar|
  json.extract! calendar, :id, :name, :date, :description, :location
  json.event calendar.event, :id
  json.id calendar_id(calendar, format: :json)
end