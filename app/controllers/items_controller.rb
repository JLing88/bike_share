class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      flash[:success] = "Item #{@item.title} edited"
      redirect_to admin_bike_store_path
    else
      flash[:notice] = "Item not updated"
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image_url, :status)
  end

end
