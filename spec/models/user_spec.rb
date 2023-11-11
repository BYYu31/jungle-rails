require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    it 'should save a user with all required field are set' do
      @user = User.new(first_name: 'Bo', last_name: 'Yu', email: 'aixi@live.ca', password: '123456abc', password_confirmation: '123456abc')
      @user.save
      expect(@user).to be_valid
    end
    it 'should not save if password and confirmation are not the same' do
      @user = User.new(first_name: 'Bo', last_name: 'Yu', email: 'aixi@live.ca', password: '123456abc', password_confirmation: '123456abcd')
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'should have only one email per user' do
      @user1 = User.new(first_name: 'Bo', last_name: 'Yu', email: 'AIXI@live.ca', password: '123456abc', password_confirmation: '123456abc')
      @user1.save
      @user2 = User.new(first_name: 'Bo', last_name: 'Yu', email: 'aixi@live.ca', password: '123456abc', password_confirmation: '123456abc')
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
  end
  describe '.authenticate_with_credentials' do
    it 'should allow user with valid credentials to log in' do
      @user = User.new(first_name: 'Bo', last_name: 'Yu', email: 'aixi@live.ca', password: '123456abc', password_confirmation: '123456abc')
      @user.save
      @valid_user = User.authenticate_with_credentials('aixi@live.ca', '123456abc')
      expect(@valid_user).to_not eql(nil)
    end
    it 'should still allow user to log in with white space' do
      @user = User.new(first_name: 'Bo', last_name: 'Yu', email: 'aixi@live.ca', password: '123456abc', password_confirmation: '123456abc')
      @user.save
      @valid_user = User.authenticate_with_credentials('   aixi@live.ca   ', '123456abc')
      expect(@valid_user).to_not eql(nil)
    end
    it 'should still allow user to log in with case insensitive email' do
      @user = User.new(first_name: 'Bo', last_name: 'Yu', email: 'aixi@live.ca', password: '123456abc', password_confirmation: '123456abc')
      @user.save
      @valid_user = User.authenticate_with_credentials('   AIXI@live.ca   ', '123456abc')
      expect(@valid_user).to_not eql(nil)
    end
  end
end
