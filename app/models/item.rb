class Item < ApplicationRecord
  validates :name, :description, :price, :quantity, :seller_id, presence: true

  has_many :categories_items
  has_many :categories, through: :categories_items
  belongs_to :seller, class_name: "User"
  has_many :transactions
  has_many :buyers, through: :transactions
end
