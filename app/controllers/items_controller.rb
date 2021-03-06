class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_order, only: [:index, :show, :edit]
  before_action :contributor_confiramation, only: [:edit, :update, :destroy]
  before_action :sold_out, only: :edit

  def index
    @items = Item.order('created_at DESC')
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
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :information, :category_id, :status_id, :postage_id, :prefecture_id, :sending_day_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_order
    @orders = Order.all
  end

  def contributor_confiramation
    redirect_to root_path unless current_user == @item.user
  end

  def sold_out
    @orders.each do |order|
      redirect_to root_path if order.item_id == @item.id
    end
  end
end
