json.array! @messages.each do |message|
  json.id message.id
  json.name message.user.username
  json.body message.body
  json.group_id message.group_id
  json.created_at message.created_at
end
