require 'rails_helper'

RSpec.describe User, type: :model do
  # must have password and password_confirmation fields to save
  # password and password confirmation must match

  # Emails must be unique (not case sensitive; for example,
  # TEST@TEST.com should not be allowed if test@test.COM
  # is in the database)

  # Email, first name, and last name should also be required

  describe 'Validations' do
    ###########################################
    it "If given all the corrent info, saves the user" do
      @user = User.new(first_name: "popopopo",
                       last_name: "Gibson",
                       password: "eggs",
                       email: "hihi@hoho.com",
                       password_confirmation: "eggs")
      @user.save!
      expect(@user.id).to be_present
    end
    ###########################################
    it "If passwords don't match, error" do
      @user = User.new(password: "eggs",
                       password_confirmation: "popo")
      @user.validate
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    ###########################################
    it "If there is no password, error" do
      @user = User.new
      @user.validate
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    ###########################################
    it "if password is less than 4 characters error" do
      @user = User.new(first_name: "popopopo",
                       last_name: "Gibson",
                       password: "w",
                       email: "hihi@hoho.com",
                       password_confirmation: "w")
      @user.validate
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
    end
    ###########################################
    it "email must be unique " do
      @user1 = User.new(first_name: "popopopo",
                       last_name: "Gibson",
                       password: "w222",
                       email: "bob@hoho.com",
                       password_confirmation: "w222")
      @user1.save!
      @user2 = User.new(first_name: "popopopo",
                       last_name: "Gibson",
                       password: "w222",
                       email: "BOB@HOHO.com",
                       password_confirmation: "w222")
      @user2.validate
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
  end
end
