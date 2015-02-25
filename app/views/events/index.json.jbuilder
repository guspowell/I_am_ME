json.array!(@events) do |event|
  json.extract! event, :id, :name, :date, :description, :location
  json.image event.image, :url
  json.url event_url(event, format: :json)
end
