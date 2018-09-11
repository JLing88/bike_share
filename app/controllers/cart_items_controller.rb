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

  def destroy
    item = Item.find(params[:item_id])
    cart.remove_item(item.id)

  end
    # flash[:success] = "#{cart_item.title} has been deleted"
end
