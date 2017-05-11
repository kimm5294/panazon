class AddPurchasedColumnToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :purchased, :boolean, null: false, default: false
  end
end
