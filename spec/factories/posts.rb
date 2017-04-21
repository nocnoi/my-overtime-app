FactoryGirl.define do
	factory :post do
	  date Date.today
	  rationale "rationale1"
	  user
	end

	factory :second_post, class: "Post" do
	  date Date.yesterday
	  rationale "rationale2"
	  user
	end
end