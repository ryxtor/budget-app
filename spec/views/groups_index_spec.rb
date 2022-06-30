require 'rails_helper'

RSpec.describe 'GroupsIndex', type: :system do
  describe 'New' do
    before(:each) do
      User.create(name: 'Test', email: 'b@b', password: '123456', confirmed_at: Time.now)
      visit new_user_session_path
      fill_in 'Email', with: 'b@b'
      fill_in 'Password', with: '123456'
      click_button 'Log In'
    end

    it 'should show groups' do
      expect(page).to have_content('CATEGORIES')
    end

    it 'should show Add Category button' do
      expect(page).to have_button('Add Category')
    end

    it 'should take to new group form' do
      click_button 'Add Category'
      expect(page).to have_content('NEW CATEGORY')
    end
  end
end
