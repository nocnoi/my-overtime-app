AdminUser.create(email: "admin@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Admin", last_name: "Name")
puts "1 AdminUser created"

@user = User.create(email: "user@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "User", last_name: "Seed")
puts "1 User created"

100.times do |post|
	Post.create(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)	
end
puts "100 posts created"




