class AddCoverAndImageToListings < ActiveRecord::Migration
  def change
    add_column :listings, :cover, :string
    add_column :listings, :images, :string, array: true, default: []
  end
end
