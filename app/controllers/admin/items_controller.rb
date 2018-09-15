class Admin::ItemsController < Admin::BaseController
  def index
    @items = Item.all
  end

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



  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image_url, :status)
  end

end
