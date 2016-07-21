class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer :user_id, null: false, uniqueness: true
      t.string :uid, null: false, uniqueness: true
      t.string :token, null: false
  	  t.string :provider, null: false
      t.timestamps null: false
    end
  end
end
