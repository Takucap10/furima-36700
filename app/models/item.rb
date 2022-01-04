class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtentions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :sending_day
end
