json.array!(@staffs) do |staff|
  json.extract! staff, :id, :event_id, :role_id, :shift_id, :permanent_user
  json.url staff_url(staff, format: :json)
end
