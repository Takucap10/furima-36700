class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
  end

  private
  def item_params
    params.require(:item).permit:(:name,:information, :category_id, :status_id, :postage_id, :prefecture_id, :sending_day_id, :price, :image).merge(user_id: current_user.id)
  end

end
