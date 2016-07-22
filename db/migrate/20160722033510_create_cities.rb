class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
    	t.string :description, null: false, uniqueness: true
    	t.integer :state_id, null: false
    	t.integer :country_id, null: false

      t.timestamps null: false
    end
  end
end
