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
      fill_in :user_first_name, with: username
      fill_in :user_last_name, with: "Schmoe"
      fill_in :user_address, with: "111 Main St"
      click_on "Create User"

      expect(page).to have_content("Logged in as #{username}")
      expect(current_path).to eq(dashboard_path)
    end

    it 'blocks registration when username is not unique' do
      username = "Jesse"
      User.create!(username: username, password: 'password', first_name: 'John', address: '1 Pennsylvania Avenue', last_name: 'Doe' )

      visit root_path

      click_on "Sign Up"

      fill_in :user_username, with: username
      fill_in :user_password, with: "password"
      fill_in :user_first_name, with: username
      fill_in :user_last_name, with: "Schmoe"
      fill_in :user_address, with: "111 Main St"
      click_on "Create User"

      expect(page).to_not have_content("Welcome, #{username}")
      expect(page).to have_content("Username already taken")
      expect(current_path).to eq(users_path)
    end
  end

  describe 'login' do
    it 'allows a registered user to login' do
      user = User.create!(username: "Jesse", password: 'password', address: '123 Main St', first_name: 'Jesse', last_name: 'James')

      visit root_path
      click_on "Sign In"
      expect(current_path).to eq(login_path)
      fill_in :username, with: user.username
      fill_in :password, with: user.password
      click_on "Log In"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Logged in as #{user.username}")
    end

    it 'stops invalid users from logging in' do
      visit root_path
      click_on "Sign In"
      expect(current_path).to eq(login_path)
      fill_in :username, with: "Pat"
      fill_in :password, with: "password"

      click_on "Log In"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Username and password do not match")
      expect(page).to have_content("Sign In")
    end
    it 'directs to user dashboard after logging in or creating an account' do

      visit root_path

      click_on "Sign Up"

      fill_in :user_username, with: "Pat"
      fill_in :user_password, with: "password"
      fill_in :user_first_name, with: "Joe"
      fill_in :user_last_name, with: "Schmoe"
      fill_in :user_address, with: "111 Main St"
      click_on "Create User"

      user = User.last

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content(user.username)
      expect(page).to have_content(user.address)
      expect(page).to have_content(user.name)
    end
  end
end
