get '/categories/:category_id/auctions/new' do
  @category = Category.find(params[:category_id])
  erb :'/auctions/new'
end

post '/categories/:category_id/auctions' do
  @category = Category.find(params[:category_id])
  @category.auctions.create!(params[:auctions])
  redirect :'/categories/#{@category.id}'
end


