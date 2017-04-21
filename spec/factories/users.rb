FactoryGirl.define do
	sequence :email do |n|
		"test#{n}@example.com"
	end

	factory :user do
	  first_name 'Jane'
	  last_name 'Doe'
	  email { generate :email }
	  password 'blahblah'
	  password_confirmation 'blahblah'
	end

	factory :admin_user, class: "AdminUser" do
	  first_name 'Admin'
	  last_name 'User'
	  email { generate :email}
	  password 'blahblah'
	  password_confirmation 'blahblah'
	end
end
