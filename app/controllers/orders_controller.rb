class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :user_check, only: :index
  before_action :sold_out, only: :index
  
  def index
    @order_address = OrderAddress.new
  end
  
  def new
    @order_address = OrderAddress.new
  end
  
  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
    redirect_to root_path
    else
      render :index
    end
  end
  
  private
  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
  
  def set_item
    @item = Item.find(params[:item_id])
    @orders = Order.all
  end

  def user_check
    redirect_to root_path if current_user == @item.user
  end

  def sold_out
    @orders.each do |order|
      if order.item_id == @item.id
          redirect_to root_path
      end
    end
  end
end
