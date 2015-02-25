
  json.extract! @event, :id, :name, :date, :description, :created_at, :updated_at, :location

  json.image @event.image, :url
