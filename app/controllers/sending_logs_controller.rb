class SendingLogsController < ApplicationController

def index
end

def new
end

def create
  @sending_log = SendingLog.create(sending_log_params)
  SendingAddress.create(sending_address_params)
  redirect_to root_path
end

private
def sending_log_params
  params.merge(user_id: current_user.id).merge(item_id: @item.id)
end

def sending_address_params
  params.permit(:post_code, :prefecture_id, :city, :block, :building, :phone_number).merge( sending_log_id: @sending_log_id)
end