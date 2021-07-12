class ItemsController < ApplicationController
  def index
    
  end
  
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :information, :category_id, :status_id, :shipping_id, :area_id, :days_id, :price,)
  end

end
