require 'rails_helper'

RSpec.describe 'FeesNew', type: :system do
  describe 'New' do
    before(:all) do
      User.destroy_all
      Group.destroy_all
    end
    before(:each) do
      @user = User.new(name: 'Test', email: 'b@b', password: '123456', confirmed_at: Time.now)
      @user.save
      @group = Group.new(name: 'Test', icon: 'fa-credit-card', user_id: @user.id)
      @group.save
      visit new_user_session_path
      fill_in 'Email', with: 'b@b'
      fill_in 'Password', with: '123456'
      click_button 'Log In'
      find('.capybara').click
    end

    it 'should show category show page' do
      expect(page).to have_content('TEST')
    end

    it 'should show Add Transaction button' do
      expect(page).to have_button('Add Transaction')
    end

    it 'should take to new transaction form' do
      click_button 'Add Transaction'
      expect(page).to have_content('NEW TRANSACTION')
    end

    it 'should show name field' do
      click_button 'Add Transaction'
      expect(page).to have_field('Transaction Name')
    end

    it 'should show amount field' do
      click_button 'Add Transaction'
      expect(page).to have_field('Amount')
    end

    it 'should show submit button' do
      click_button 'Add Transaction'
      expect(page).to have_button('Add')
    end

    it 'should create new fee' do
      click_button 'Add Transaction'
      fill_in 'Transaction Name', with: 'Test Fee'
      fill_in 'Amount', with: '100'
      click_button 'Add'
      expect(page).to have_content('TEST')
    end
  end
end
