class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references  :buyer, null: false
      t.references  :item, null: false
      t.integer     :quantity, null: false

      t.timestamps(null: false)
    end
  end
end
