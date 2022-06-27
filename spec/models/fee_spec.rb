require 'rails_helper'

RSpec.describe Fee, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.new(name: 'John Doe', email: 'a@a', password: '123456', confirmed_at: Time.now)
      @group = Group.new(name: 'Group 1', icon: 'icon.png', user: @user)
      @fee = Fee.new(name: 'Fee 1', amount: 10, user: @user)
    end
    it 'should be valid' do
      expect(@fee).to be_valid
    end

    it 'should not be valid without a name' do
      @fee.name = nil
      expect(@fee).to_not be_valid
    end

    it 'should not be valid is the name is too long' do
      @fee.name = 'a' * 51
      expect(@fee).to_not be_valid
    end

    it 'should not be valid without an amount' do
      @fee.amount = nil
      expect(@fee).to_not be_valid
    end

    it 'should not be valid with an amount less than 0' do
      @fee.amount = -1
      expect(@fee).to_not be_valid
    end
  end
end
