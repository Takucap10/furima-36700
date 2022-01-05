class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtentions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :sending_day

  belongs_to :user

  with_options presence: true do
  validates :name
  validates :information
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sending_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price
  end
end
