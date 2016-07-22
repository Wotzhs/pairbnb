class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
    	t.string :description, null: false, uniqueness: true

      t.timestamps null: false
    end
  end
end
