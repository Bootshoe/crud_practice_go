get '/' do
  @categories = Category.all
  erb :"/categories/show"
end
