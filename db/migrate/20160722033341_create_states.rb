class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
    	t.string :description, null: false, uniqness: true
    	t.integer :country_id, null: false

      t.timestamps null: false
    end
  end
end
