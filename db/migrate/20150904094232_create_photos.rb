class CreatePhotos < ActiveRecord::Migration
  def change
  	create_table :photos do |t|
  		t.string :filename, null: false 
  		t.string :photo_description
  		t.integer :album_id, null: false
  		t.timestamps null: false
  	end
  end
end
