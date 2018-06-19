require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should have a valid test' do
      @user = User.new(first_name: 'Jin', last_name: 'Ha', email: 'hjd007wwkd@hotmail.com', 
          password: '0000000', password_confirmation: '0000000')
      expect(@user).to be_valid
    end

    it 'should be invalid without a matching password confirmation' do
      @user = User.new(first_name: 'Jin', last_name: 'Ha', email: 'hjd007wwkd@hotmail.com', 
          password: '0000000', password_confirmation: '0000001')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should have a unique email address' do
      @user = User.new(first_name: 'Jin', last_name: 'Ha', email: 'hjd007wwkd@hotmail.com', 
          password: '0000000', password_confirmation: '0000000')
      @user1 = User.new(first_name: 'Jin', last_name: 'Ha', email: 'HJD007WWKD@HOTMAIL.COM', 
          password: '0000000', password_confirmation: '0000000')
      @user.save!
      expect(@user1).to_not be_valid
      expect(@user1.errors.full_messages).to include("Email has already been taken")
    end

    it 'should include a first name' do
      @user = User.new(last_name: 'Ha', email: 'hjd007wwkd@hotmail.com', 
          password: '0000000', password_confirmation: '0000000')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'should include a last name' do
      @user = User.new(first_name: 'Jin', email: 'hjd007wwkd@hotmail.com', 
          password: '0000000', password_confirmation: '0000000')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Last name can't be blank"    
    end

    it 'should include an email address' do
      @user = User.new(first_name: 'Jin', last_name: 'Ha', 
          password: '0000000', password_confirmation: '0000000')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'should include a password with minimum 6 characters' do
      @user = User.new(first_name: 'Jin', last_name: 'Ha', email: 'hjd007wwkd@hotmail.com', 
          password: '000', password_confirmation: '000')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end

  end

  describe '.authenticate_with_credentials' do
    
    before :each do
      @user = User.create(first_name: 'Jin', last_name: 'Ha', email: 'hjd007wwkd@hotmail.com', 
          password: '0000000', password_confirmation: '0000000')
    end

    it 'should return a truthy value' do
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to be_truthy
    end

    it 'should return a truthy value' do
      expect(User.authenticate_with_credentials(' hjd007wwkd@hotmail.com ', @user.password)).to be_truthy
    end

    it 'should return a truthy value' do
      expect(User.authenticate_with_credentials(' hJd007WwKd@HoTmAiL.CoM ', @user.password)).to be_truthy
    end

  end
end
 