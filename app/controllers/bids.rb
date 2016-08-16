get '/categories/:category_id/auctions/:auction_id/bids/new' do
  @category = Category.find(params[:category_id])
  @auction = Auction.find(params[:auction_id])
  erb :'/bids/new'
end

post '/categories/:category_id/auctions/:auction_id' do
  @category = Category.find(params[:category_id])
  @auction = Auction.find(params[:auction_id])
  @bid = Bid.new(bid: params[:bid], bidder_id: session[:user_id], auction_id: params[:auction_id])
  # @auction.bids.create!(params[:bids])
  if @bid.save
      redirect :"/categories/#{params[:category_id]}/auctions/#{params[:auction_id]}"
  else
    @errors = @bid.errors.full_messages
    erb :'/bids/new'
  end
end
