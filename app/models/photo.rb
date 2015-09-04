class Photo < ActiveRecord::Base
  mount_uploader :filename, Uploader
  
  belongs_to :album

end
