class Admin::ItemsController < Admin::BaseController

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      flash[:notice] = "#{@item.title} added to all Bike Accessories"
      redirect_to item_path(@item)
    else
      render :new
    end
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
