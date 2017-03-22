json.array! @messages.each do |message|
  json.id message.id
  json.name message.user.name
  json.body message.body
  json.chatroom_id message.chatroom_id
  json.created_at message.created_at
end
