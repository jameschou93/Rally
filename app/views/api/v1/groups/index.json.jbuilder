json.array! @groups.each do |group|
json.id group.id
json.name group.name
json.bio group.bio
json.private group.private?
json.mygroup group.mygroup?(current_user)
json.categories group.categories.each do |category|
  json.id category.id
  json.name category.name
end
json.members group.users.each do |user|
json.id user.id
json.first_name user.first_name
json.last_name user.last_name
json.username user.username
json.email user.email
end

end
