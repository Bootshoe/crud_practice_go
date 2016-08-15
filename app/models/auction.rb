class Auction < ActiveRecord::Base
  belongs_to :seller, class_name: :User, foreign_key: :seller_id
  has_many  :bids
  has_one :highest_bid, class_name: :Bid
  belongs_to :category

end
