get '/categories/:category_id/auctions/new' do
  @category = Category.find(params[:category_id])
  erb :'/auctions/new'
end

post '/categories/:category_id/auctions' do
  @category = Category.find(params[:category_id])
  @auction = Auction.new(name: params[:name], description: params[:description], seller_id: session[:user_id], end_date: params[:end_date], category_id: params[:category_id])
  # @category.auctions.create!(params[:auctions])
  if @auction.save
      redirect :"/categories/#{params[:category_id]}"
  else
    @errors = @auction.errors.full_messages
    erb :'/auctions/new'
  end
end

get '/categories/:category_id/auctions/:auction_id' do
  @auction = Auction.find(params[:auction_id])
  @category = Category.find(params[:category_id])
  @bids = Bid.where(auction: @auction.id).order(:bid)
  erb :"/auctions/show"
end

