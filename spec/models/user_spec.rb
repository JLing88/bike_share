require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_presence_of(:password)}
    it {should validate_presence_of(:address)}
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
  end
  
  describe 'relationships' do
    it {should have_many :orders}
  end
  
  describe 'roles' do
    it "can be created as an admin" do
      admin = User.create!(username: "Boss", password: "555555", first_name: "firstname", last_name: "lastname", address: "place", role: 1)

      expect(admin.role).to eq("admin")
      expect(admin.admin?).to be_truthy
    end

    it "can be created as a default user" do
      user = User.create(username: "notBoss", password:"4444444", first_name: "firstname", last_name: "lastname", address: "place", role: 0)

      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end
  end
end
