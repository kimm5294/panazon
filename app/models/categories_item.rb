class CategoriesItem < ApplicationRecord
  validates :category_id, :item_id, presence: true
  validates :item_id, uniqueness: { scope: :category_id }

  belongs_to :category
  belongs_to :item
end
