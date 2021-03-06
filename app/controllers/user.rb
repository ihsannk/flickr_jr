get '/login' do
  @user = session[:user]
  erb :login
end

post '/login' do
  @username = params[:username]
  @password = params[:password]

  @user = User.find_by(username: @username)
    if @user && @user.password == @password
      path = "/"
    else
      path = "/login"
    end

  session[:user] = @username
  session[:id] = @user.id
  redirect to path
end

post '/signup' do
  @username = params[:username]
  @password = params[:password]

  @user = User.create(username: @username, password: @password)
  @albums = Album.create(user_id: @user.id, album_name: "#{@user.username}'s_folder", album_description: "My default photo album")
  session[:user] = @username
  session[:id] = @user.id
  redirect to "/"
end

get '/logout' do
  session.clear
  redirect to "/"
  erb :index
end