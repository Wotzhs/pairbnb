class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.integer :listing_id, null: false
    	t.string :path, null: false
    	t.string :role, null: false, default: "list"

      t.timestamps null: false
    end
  end
end
