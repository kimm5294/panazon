class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :username, null: false
      t.string  :first_name
      t.string  :last_name
      t.string  :email, null: false
      t.string  :password_digest, null: false

      t.timestamps(null: false)
    end

    add_index(:users, [:username, :email], unique: true)
  end
end
