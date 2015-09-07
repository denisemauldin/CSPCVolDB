json.array!(@events) do |event|
  json.extract! event, :id, :name, :abbv, :open_time, :duration, :default_location
  json.url event_url(event, format: :json)
end
