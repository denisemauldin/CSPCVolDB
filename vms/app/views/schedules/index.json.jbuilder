json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :staff_id, :user_id, :location_id
  json.url schedule_url(schedule, format: :json)
end
