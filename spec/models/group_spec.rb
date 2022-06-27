require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.new(name: 'John Doe', email: 'a@a', password: '123456', confirmed_at: Time.now)
      @group = Group.new(name: 'Group 1', icon: 'icon.png', user: @user)
    end
    it 'should be valid' do
      expect(@group).to be_valid
    end

    it 'should not be valid without a name' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'should not be valid is the name is too long' do
      @group.name = 'a' * 51
      expect(@group).to_not be_valid
    end

    it 'should not be valid without a icon' do
      @group.icon = nil
      expect(@group).to_not be_valid
    end
  end
end
