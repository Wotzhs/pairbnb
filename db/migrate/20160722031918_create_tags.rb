class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
    	t.string :description, null: false, uniqueness: true

      t.timestamps null: false
    end
  end
end
