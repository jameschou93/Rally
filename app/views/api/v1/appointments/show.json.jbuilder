
json.id @appointment.id
json.title @appointment.title
json.location_id @appointment.location_id
json.address @appointment.location.address
json.city @appointment.location.city
json.state @appointment.location.state
json.zip_code @appointment.location.zip_code
json.latitude @appointment.location.latitude
json.longitude @appointment.location.longitude
json.start_time @appointment.start_time
json.end_time @appointment.end_time
json.date @appointment.date
json.members @appointment.users.each do |user|
  json.id user.id
  json.first_name user.first_name
  json.last_name user.last_name
  json.email user.email
end

