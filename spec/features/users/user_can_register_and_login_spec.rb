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
  end
end
