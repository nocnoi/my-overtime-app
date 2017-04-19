@user = User.create(email: "nisha@nisha.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Nisha", last_name: "Salim")
puts "1 User created"

100.times do |post|
	Post.create(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)	
end

puts "100 posts created"

