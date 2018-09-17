class OrdersController < ApplicationController

  before_action :validate_user_resource?, only: [:show]

  def create
    if current_user
      order = Order.create(user_id: current_user.id, status: 'ordered', created_at: Time.now, updated_at: Time.now)
      session[:cart].each do |item_id, quantity|
        item = Item.find(item_id)
        item.order_items.create!(item_id: item.id, order_id: order.id, quantity: quantity)
        cart = Cart.new(session[:cart]= nil)
      end
        if order.save
          flash[:notice] = "Successfully submitted your order totaling $#{order.total.round(2)}"
        redirect_to dashboard_path
      else
        redirect_to new_user_path
      end
    end
  end

  def show
    if validate_user_resource?
      @user = current_user
      @order = Order.find(params[:id])
      @order_items = OrderItem.where(order_id: @order.id)
    else
      render file: "public/404.html"
    end
  end
end
