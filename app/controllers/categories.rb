get '/categories' do
  @categories = Category.all
  erb :"/categories/index"
end


post '/categories' do
  Category.create(params)
  redirect '/categories'
end

get '/categories/:category_id' do
  @category = Category.find(params[:category_id])
  @auctions = Auction.where(category: @category).order(:updated_at)
  erb :'categories/show'
end
