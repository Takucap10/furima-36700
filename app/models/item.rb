class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #ActiveHash用のアソシエーション
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :sending_day

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
  validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
  end
  validates :price, numericality: { greater_than_or_equal_to: 300 , less_than_or_equal_to: 9999999 , message: 'is out of setting range'}
end
