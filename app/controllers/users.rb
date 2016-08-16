get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/login' do
  erb :'users/login'
end

post '/users/login' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user
    session[:user_id] = @user.id
    redirect '/'
  else
    @error = "Invalid entries"
    erb :'users/login'
  end
end

get '/users/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/not_authorized' do
  erb :not_authorized
end

get '/users/:user_id' do
  @user = User.find(params[:user_id])
  @auctions = Auction.where(seller_id: @user.id)
  @bids = Bid.where(bidder_id: @user.id)
  erb :'users/index'
end


get "/users/:id/edit" do
  authorize!
  erb :"/users/edit"
end

put "/users/:id" do
  authorize!
  @user = User.find(params[:id])
  @user.update(params[:user])
  redirect "/users/params[:id]"
end
