class CartItemsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    cart.add_item(item)
    session[:cart] = cart.data
    redirect_to bike_store_path
  end

  def add_item
    item = Item.find(params[:id])
    cart.add_item(item)
    session[:cart] = cart.data
    redirect_to cart_path
  end

  def decrease_item
    item = Item.find(params[:id])
    cart.decrease_item(item)
    session[:cart] = cart.data
    redirect_to cart_path
  end

  def index
    @cart_items = cart.items
  end
end
