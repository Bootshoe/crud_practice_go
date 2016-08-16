class Bid < ActiveRecord::Base
  belongs_to  :bidder, class_name: :User
  belongs_to  :auction

  validates_presence_of :auction_id
  validates_presence_of :bidder_id
  validates_presence_of :bid

end
