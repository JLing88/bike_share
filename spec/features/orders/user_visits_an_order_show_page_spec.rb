require 'rails_helper'


describe 'As a registered user' do
  before(:each) do
    @user = User.create!(username: "Pat", password: "test", address: '123 Main st', first_name: 'Pat', last_name: 'Rat')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @item = Item.create(title: 'item 1', description: 'cool thing', price: 100, image_url: 'https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png')
    @order_1 = @user.orders.create!(status: "completed", created_at: Time.now, updated_at: Time.now)
    @order_item_1 = @item.order_items.create!(order_id: @order_1.id, quantity: 3)
    @order_2 = @user.orders.create!(status: "cancelled", created_at: Time.now, updated_at: Time.now)
    @order_item_2 = @item.order_items.create!(order_id: @order_2.id, quantity: 4)
  end

  context 'they visit /dashboard and click on an order' do
    it 'displays order information' do
      visit dashboard_path

      click_on ("##{@order_1.id}")

      expect(current_path).to eq(order_path(@order_1))
      expect(page).to have_content("#{@user.first_name} #{@user.last_name}")
      expect(page).to have_content(@user.address)
      expect(page).to have_content(@order_1.status)
      expect(page).to have_content(@item.title)
      expect(page).to have_content(@order_item_1.quantity)
      expect(page).to have_content(@order_item_1.subtotal)
      expect(page).to have_content(@order_1.created_at.strftime("%m-%d-%Y %H:%M"))
      expect(page).to have_content(@order_1.total)
    end
  end

  context "they visit /dashboard and click on a cancelled order" do
    it 'displays updated_at for cancelled order' do
      visit dashboard_path

      click_on ("##{@order_2.id}")

      expect(page).to have_content(@order_2.status)
      expect(page).to have_content("Most Recent Activity: #{@order_2.updated_at.strftime("%m-%d-%Y %H:%M")}")
    end
  end
end
