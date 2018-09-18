require 'rails_helper'

describe 'user edits profile info' do
  describe 'user links from user-dashboard' do
    it 'displays a edit profile button' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      click_link 'Update My Information'

      expect(current_path).to eq(edit_user_path(user))

      fill_in :user_username, with: 'username'
      fill_in :user_password, with: "password"
      fill_in :user_first_name, with: 'user'
      fill_in :user_last_name, with: "Schmoe"
      fill_in :user_address, with: "111 Main St"

      click_button "Update User"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content(user.username)
      expect(page).to have_content(user.first_name)
      expect(page).to have_content(user.last_name)
      expect(page).to have_content(user.address)
    end
  end

  describe 'user cannot link from user-dashboard' do
    it 'to another users edit page' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main street', first_name: 'Pattt', last_name: 'Rattt')
      user_2 = User.create!(username: "Nick", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit edit_user_path(user_2)



      expect(current_path).to eq(edit_user_path(user_2))

      expect(page).to_not have_field(:username)
      expect(page).to_not have_field(:password)
      expect(page).to_not have_field(:fisrt_name)
      expect(page).to_not have_field(:last_name)
      expect(page).to_not have_field(:address)

      expect(page).to have_content('You may have mistyped the address or the page may have moved')
    end
  end
end
