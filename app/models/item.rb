class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #ActiveHash用のアソシエーション
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :sending_day

  #通常アソシエーション
  belongs_to :user
  has_one_attached :image

  #バリデーション
  with_options presence: true do
  validates :name
  validates :information
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sending_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, numericality: true
  validates :image
  end
  validates :price, numericality: { greater_than_or_equal_to: 300 , less_than_or_equal_to: 9999999 , message: 'is out of setting range'}
end
