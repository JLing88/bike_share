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

  describe '#change_status' do
    it 'changes the item status' do
      item_1 = Item.create!(title: "widget", description: "it's widgety", price: 27, image_url: "item.jpg", status: 1)
      item_2 = Item.create!(title: "gidget", description: "it's gidgety", price: 25, image_url: "item.jpg")

      expect(item_1.change_status(item_1)).to eq(0)
      expect(item_2.change_status(item_2)).to eq(1)
    end
  end
end
