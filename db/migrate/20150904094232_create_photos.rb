class CreatePhotos < ActiveRecord::Migration
  def change
  	create_table :photos do |t|
  		t.string :filename
  		t.string :photo_description
  		t.timestamps null: false
  	end
  end
end
