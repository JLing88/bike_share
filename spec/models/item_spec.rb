require 'rails_helper'

describe Item, type: :model do
  describe 'validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :description}
    it {should validate_presence_of :price}
    it {should validate_presence_of :image_url}
  end

  describe 'relationships' do
    it {should have_many :order_items}
    it {should have_many(:orders).through(:order_items) }
  end
end
