class CartItemsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    cart.add_item(item)
    session[:cart] = cart.data
    flash[:notice] = "#{item.title} added to cart!"
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

  def destroy
    item = Item.find(params[:item_id])
    cart.remove_item(item.id)
    redirect_to cart_path
    flash[:notice] = "#{item.title} removed from cart. Add it back in here:#{view_context.link_to(" #{item.title}", item_path(item))}"

  end
    # flash[:success] = "#{cart_item.title} has been deleted"
end
