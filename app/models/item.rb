class Item < ApplicationRecord
  require 'csv'

  validates :name, :description, :price, :count, :seller_id, :unit, presence: true

  has_many :categories_items
  has_many :categories, through: :categories_items
  belongs_to :seller, class_name: "User"
  has_many :transactions
  has_many :buyers, through: :transactions

  def self.import(file, user_id)
    CSV.foreach(file, headers: true) do |row|
      categories = row.delete("categories")[1]

      item = Item.new row.to_hash
      item.seller_id = user_id
      item.save
      categories.split(";").each do |category|
        category.downcase!.capitalize!
        item_category = Category.find_by(name: category)
        CategoriesItem.create(category_id: item_category.id, item_id: item.id) if !!item_category
      end
    end
  end

  def price_in_dollars
    self.price.to_f / 100
  end

  def self.spotlight
    Item.all.sample(5)
  end
end
