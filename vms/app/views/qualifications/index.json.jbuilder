json.array!(@qualifications) do |qualification|
  json.extract! qualification, :id, :user_id, :position_id, :status, :count
  json.url qualification_url(qualification, format: :json)
end
