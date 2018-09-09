require 'rails_helper'

describe 'As a logged in registered user' do
  it 'allows them to log out' do
    user = User.create!(username: "Pat", password: "test")

    visit login_path

    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_on "Log In"

    expect(page).to_not have_content("Sign In")
    click_on "Log Out"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Sign In")
  end
end
