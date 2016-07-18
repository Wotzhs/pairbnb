class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, uniqueness: true
      t.string :date_of_birth, null: false
      t.boolean :verified, null: false, default: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
      t.timestamps null: false
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end
