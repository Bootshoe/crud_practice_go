class Auction < ActiveRecord::Base
  belongs_to :seller, class_name: :User, foreign_key: :seller_id
  has_many  :bids
  has_one :highest_bid, class_name: :Bid
  belongs_to :category

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :seller_id
  validates_presence_of :end_date
  validates_presence_of :category_id

  def highestBid
    highest = self.bids.first
    self.bids.each do |bid|
     if (bid.bid) > (highest.bid)
      highest = bid
     end
    end
    highest
  end

end
