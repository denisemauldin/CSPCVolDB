json.array!(@roles) do |role|
  json.extract! role, :id, :name, :lead, :training, :shadowing, :desc
  json.url role_url(role, format: :json)
end
