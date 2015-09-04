get '/' do
  @photos = Photo.order(created_at: :desc)
  if session[:user] != nil
    @user = session[:user]
  end
  erb :index
end

