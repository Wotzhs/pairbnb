class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
    	t.string :transaction_id, null: false
    	t.integer :listing_id, null: false
    	t.integer :reservation_id, null: false
    	t.decimal :transaction_amount, precision: 7, scale: 2, null: false
    	t.integer :user_id, null: false
    	t.timestamps null: false
    end
  end
end
