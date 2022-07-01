require 'rails_helper'

RSpec.describe 'GroupsNew', type: :system do
  describe 'New' do
    before(:each) do
      User.create(name: 'Test', email: 'b@b', password: '123456', confirmed_at: Time.now)
      visit new_user_session_path
      fill_in 'Email', with: 'b@b'
      fill_in 'Password', with: '123456'
      click_button 'Log In'
      click_button 'Add Category'
    end
    it 'should show new group form' do
      expect(page).to have_content('NEW CATEGORY')
    end

    it 'should show name field' do
      expect(page).to have_field('Category Name')
    end

    it 'should show icon field' do
      expect(page).to have_field('Icon Name')
    end

    it 'should show submit button' do
      expect(page).to have_button('Create')
    end

    it 'should create new group' do
      fill_in 'Category Name', with: 'Test'
      fill_in 'Icon Name', with: 'fa-credit-card'
      click_button 'Create'
      expect(page).to have_content('CATEGORIES')
    end
  end
end
