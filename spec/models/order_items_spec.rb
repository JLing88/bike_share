require 'rails_helper'

describe OrderItem, type: :model do
  describe 'validations' do
    it {should validate_presence_of :item_id}
    it {should validate_presence_of :order_id}
  end

  describe 'relationships' do
    it {should belong_to :item}
    it {should belong_to :order}
  end

  describe 'instance methods' do
    describe '#subtotal' do
      it do
        user = User.create!(username: "test@gmail.com", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
        item = Item.create(title: 'item 1', description: 'cool thing', price: 100, image_url: 'https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png')
        order_1 = user.orders.create!(status: "completed", created_at: Time.now, updated_at: Time.now)
        order_item_1 = item.order_items.create!(order_id: order_1.id, quantity: 3)

        expect(order_item_1.subtotal).to eq(300)
      end
    end
  end
end
