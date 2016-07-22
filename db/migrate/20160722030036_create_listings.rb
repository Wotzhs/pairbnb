class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.integer :user_id, null: false
    	t.string :title, null: false
    	t.text :description, null: false
    	t.decimal :price, precision: 7, scale: 2, null: false
    	t.integer :country_id, null: false
    	t.integer :state_id, null: false
    	t.integer :city_id, null: false

      t.timestamps null: false
    end
  end
end
