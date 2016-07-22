class CreateListingTags < ActiveRecord::Migration
  def change
    create_table :listing_tags do |t|
    	t.integer :listing_id, null: false
    	t.integer :tag_id, null: false

      t.timestamps null: false
    end
  end
end
