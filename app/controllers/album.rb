get "/albums" do
  @user = session[:user]
  @albums = Album.where(user_id: session[:id])
  erb :albums
end

post "/create_album" do
  @album_name = params[:album_name]
  @album_description = params[:album_description]
  @new_album = Album.create(album_name: @album_name, album_description: @album_description, user_id: session[:id])
  
  redirect to "/albums"
end

get "/albums/:album_name" do
  @user = session[:user]
  
  @album = Album.find_by(album_name: params[:album_name])
  @photos = Photo.where(album_id: @album.id)
  
  erb :album_view
end

post '/albums/:album_name/upload_photo' do
  @filename = params[:filename]
  @photo_description = params[:photo_description]
  @album = Album.find_by(album_name: params[:album_name])

  @photo = Photo.create(filename: @filename, photo_description: @photo_description, album_id: @album.id)
  
  redirect to "/albums/#{@album.album_name}"
end

get "/albums/:album_name/:id" do
  @user = session[:user]
  @photo = Photo.find_by(id: params[:id])
  erb :photo_view
end

post "/albums/:album_name/:id/delete" do
  @photo = Photo.find_by(id: params[:id])
  album = @photo.album
  @photo.delete
  redirect to "/albums/#{album.album_name}"
end