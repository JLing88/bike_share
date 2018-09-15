class OrdersController < ApplicationController

  def create
    if current_user
      order = Order.create(user_id: current_user.id, status: 'ordered', created_at: Time.now, updated_at: Time.now)
      session[:cart].each do |item_id, quantity|
        item = Item.find(item_id)
        item.order_items.create!(item_id: item.id, order_id: order.id, quantity: quantity)
      end
        if order.save
          flash[:notice] = "Successfully submitted your order totaling $#{order.total}.00"
        redirect_to dashboard_path
      else
        redirect_to new_user_path
      end
    end
  end
end
