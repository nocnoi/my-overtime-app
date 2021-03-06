require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)   
  end

  describe 'index' do
    before do
      visit posts_path
    end 

  	it 'can be reached successfully' do
  	  expect(page.status_code).to eq(200)
  	end

  	it 'has a title of Posts' do
  	  expect(page).to have_content(/Posts/)
  	end

    it 'has a list of posts' do
      FactoryGirl.create(:post)
      FactoryGirl.create(:second_post)
      visit posts_path
      expect(page).to have_content(/rationale1|rationale2/)
      
    end
  end

  describe 'new' do
    it 'has a new post link from the homepage' do
      visit root_path
      click_link "new_post_from_nav"
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'can reach the new form successfully' do  
      expect(page.status_code).to eq(200)
    end

    it 'can be created from the new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      click_on "Save"
      expect(page).to have_content("Some rationale")
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      click_on "Save"
      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end

  describe 'edit' do
    before do
      @post = FactoryGirl.create(:post)
    end

    it 'can be reached by clicking edit on index page' do
      visit posts_path
      click_link "edit_#{@post.id}"
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(@post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"
      click_on "Save"
      expect(User.last.posts.last.rationale).to eq("Edited content")
    end
  end

  describe 'deletion' do
    it 'can be deleted' do
      @post1 = FactoryGirl.create(:post)
      visit posts_path
      click_link "delete_#{@post1.id}"
      expect(page.status_code).to eq(200)
    end
  end

end