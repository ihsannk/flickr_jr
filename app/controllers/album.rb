get "/albums" do
  @user = session[:user]
  @albums = Album.all
  erb :albums
end

post "/create_album" do
  @album_name = params[:album_name]
  @album_description = params[:album_description]
  @new_album = Album.create(album_name: @album_name, album_description: @album_description )

  redirect to "/albums"
end

get "/albums/:id" do
  @user = session[:user]
  @albums = Album.where(album_id: params[:id])
  erb :album_view
end

post '/upload' do


  # photo = @user.albums.find(params[:id]).photos.new
  # photo = Photo.new
  # photo.file = params[:image]
  # photo.save
end