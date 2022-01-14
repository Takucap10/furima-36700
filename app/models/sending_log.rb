class SendingLog < ApplicationRecord

  has_one :sending_addresses

  belongs_to :user
  belongs_to :item

end
