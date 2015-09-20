json.array!(@offers) do |offer|
  json.extract! offer, :id, :user_id, :schedule_id, :accepted
  json.url offer_url(offer, format: :json)
end
