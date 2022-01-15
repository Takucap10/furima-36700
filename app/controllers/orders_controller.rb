class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
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
    params.merge(user_id: current_user.id).merge(item_id: @item.id)
  end
end
