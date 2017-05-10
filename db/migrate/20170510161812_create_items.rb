class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string      :name, null: false
      t.text        :description, null: false
      t.float       :price, null: false
      t.integer     :quantity, null: false
      t.references  :seller, null: false

      t.timestamps(null: false)
    end
  end
end
