class Uploader < Carrierwave::Uploader::Base
  include CarrierWave::Uploader::Base
  process :resize_to_fill =>[200, 200]
  
  storage :file

  def store_dir
  	'images'
  end


end