class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :categories_items
  has_many :items, through: :categories_items
end
