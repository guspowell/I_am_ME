
  json.extract! @event, :id, :name, :date, :description, :created_at, :updated_at

  json.image @event.image, :url
