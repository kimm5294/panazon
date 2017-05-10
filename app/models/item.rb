class Item < ApplicationRecord
  validates :name, :description, :price, :quantity, presence: true

  has_many :categories_items
  has_many :categories, through: :categories_items
end
