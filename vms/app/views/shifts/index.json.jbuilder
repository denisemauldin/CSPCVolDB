json.array!(@shifts) do |shift|
  json.extract! shift, :id, :start, :duration
  json.url shift_url(shift, format: :json)
end
