require 'rails_helper'

describe Order, type: :model do
  describe 'validations' do
    it {should validate_presence_of :status}
    it {should validate_presence_of :created_at}
    it {should validate_presence_of :updated_at}
    it {should validate_presence_of :user_id}
  end

  describe 'relationships' do
    it {should belong_to :user}
    it {should have_many :order_items}
    it {should have_many(:items).through(:order_items)}
  end

  describe 'instance methods' do
    describe '#total' do
      it do
        user = User.create!(username: "Nick", password: "Nick", address: '123 Main street', first_name: 'Rad', last_name: 'Mobile')
        item = Item.create!(title: 'item 1', description: 'cool thing', price: 100, image_url: 'https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png')
        order = Order.create(status: 'Ordered', user_id: user.id, created_at: Time.now, updated_at: Time.now)
        order_item = order.order_items.new(item_id: item.id, quantity: 5)

        expect(order.total).to eq(500)
      end
    end

    describe '#by_status' do
      
    end
  end
end
