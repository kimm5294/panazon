class Transaction < ApplicationRecord
  validates :buyer_id, :item_id, :quantity, presence: true

  belongs_to :buyer, class_name: "User"
  belongs_to :item
  has_one :seller, through: :item
end
