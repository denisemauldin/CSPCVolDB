json.array!(@positions) do |position|
  json.extract! position, :id, :name, :training, :shadowing, :desc
  json.url position_url(position, format: :json)
end
