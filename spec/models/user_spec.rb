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
end
