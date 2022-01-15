class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :block, :building, :phone_number

  with_options presence: true do 
    varidates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows(123-4567)"}
    validates :city
    validates :block
    validates :phone_number, numericality: {only_integer: true, message: "is invalid. Input only number"}, length:{ minimum: 10, message: "is too short (minimum length 10)"}
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
end
