require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.new(name: 'John Doe', email: 'a@a', password: '123456', confirmed_at: Time.now)
    end
    it 'should be valid' do
      expect(@user).to be_valid
    end

    it 'should not be valid without a name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'should not be valid whitout a email' do
      @user.name = 'John Doe'
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'should not be valid without a password' do
      @user.name = 'John Doe'
      @user.email = 'a@a'
      @user.password = nil
      expect(@user).to_not be_valid
    end
  end
end
