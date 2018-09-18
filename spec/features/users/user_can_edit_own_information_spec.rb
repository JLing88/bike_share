require 'rails_helper'

describe 'user edits profile info' do
  describe 'user links from user-dashboard' do
    it 'displays a edit profile button' do
      user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      click_link 'Update My Information'

      expect(current_path).to eq(edit_user_path(user))

      

    end
  end
end
