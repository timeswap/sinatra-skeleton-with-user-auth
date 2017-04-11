# login form
get '/sessions/new' do
	erb :'/sessions/new'
end

# login action
post '/sessions' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user
    login
    redirect "/users/#{@user.id}"
  else
    @errors = ["Email or Password not found"]
    erb :'/sessions/new'
  end
end

#logout action
delete '/sessions' do
	logout
	redirect '/'
end
