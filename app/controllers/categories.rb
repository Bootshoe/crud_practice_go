get '/categories' do
  @categories = Category.all
  erb :"/categories/index"
end


post '/categories' do
  @category = Category.new(params)
  if @category.save
    redirect '/categories'
  else
    @errors = @category.errors.full_messages
    @categories = Category.all
    erb :'/categories/index'
  end

end

get '/categories/:category_id' do
  @category = Category.find(params[:category_id])
  @auctions = Auction.where(category: @category.id).order(:updated_at)
  erb :'/categories/show'
end
