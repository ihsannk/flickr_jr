class CreateAlbums < ActiveRecord::Migration
  def change
  	create_table :albums do |t|
  		t.string :album_name, null: false
  		t.string :album_description, null: false
  		t.integer :user_id, null: false
  		t.timestamps null: false
  	end
  end
end
