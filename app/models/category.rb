class Category < ActiveRecord::Base
  # Remember to create a migration!
  has_many  :auctions

  validates_presence_of :name

end
