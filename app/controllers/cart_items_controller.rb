class CartItemsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    cart.add_item(item)
    session[:cart] = cart.data
    redirect_to root_path
  end

  def index
    @cart_items = cart.items
  end
end
