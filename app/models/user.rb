require 'BCrypt'

class User < ActiveRecord::Base
include BCrypt

  has_many  :bids, class_name: :Bid, foreign_key: :bidder_id
  has_many  :auctions, foreign_key: :seller_id

end

