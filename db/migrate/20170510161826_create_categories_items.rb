class CreateCategoriesItems < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_items do |t|
      t.references  :category, null: false
      t.references  :item, null: false

      t.timestamps(null: false)
    end
  end
end
