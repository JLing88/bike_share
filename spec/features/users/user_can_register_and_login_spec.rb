require 'rails_helper'

describe "As a visitor" do
  describe 'registration' do
    it 'allows a visitor to register' do
      username = "Becca"

      visit root_path

      click_on "Sign Up"

      expect(current_path).to eq(new_user_path)

      fill_in :user_username, with: username
      fill_in :user_password, with: "password"
      click_on "Create User"

      user = User.last

      expect(page).to have_content("Welcome, #{username}!")
      expect(current_path).to eq(user_path(user))
    end

    it 'blocks registration when username is not unique' do
      username = "Jesse"
      User.create!(username: username, password: 'password')

      visit root_path

      click_on "Sign Up"

      fill_in :user_username, with: username
      fill_in :user_password, with: "password"
      click_on "Create User"

      expect(page).to_not have_content("Welcome, #{username}!")
      expect(page).to have_content("Username already taken")
      expect(current_path).to eq(users_path)
    end
  end

  describe 'login' do
    it 'allows a registered user to login' do
      user = User.create!(username: "Jesse", password: 'password')

      visit root_path
      click_on "Sign In"
      expect(current_path).to eq(login_path)
      fill_in :username, with: user.username
      fill_in :password, with: user.password
      click_on "Log In"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Welcome, #{user.username}!")
    end

    it 'stops invalid users from logging in' do

    end
  end
end
