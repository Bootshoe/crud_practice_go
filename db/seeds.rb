u1 = User.create(username: "craig", email: "craig@email.com", hashed_password: "password")
u2 = User.create(username: "bruce", email: "batman@batman.com", hashed_password: "password")
u3 = User.create(username: "tim", email: "robin@robin.com", hashed_password: "password")
u4 = User.create(username: "barb", email: "batgirl@batgril.com", hashed_password: "password")

c1 = Category.create(name: "cars")
c2 = Category.create(name: "electronics")
c3 = Category.create(name: "books")

a1 = Auction.create(name: "Detective comics #27", description: "Good condition from 1939", seller_id: 2, end_date: "8/19/2016", category_id: 3)
a2 = Auction.create(name: "iphone 6 black", description: "barely used iphone 6, no scratches", seller_id: 3, end_date: "09/09/2016", category_id: 2)
a3 = Auction.create(name: "2012 Nissan Versa", description: "20,000 miles, no accidents", seller_id: 1, end_date: "08/25/2016", category_id: 1)

b1 = Bid.create(auction_id: 1, bid: 100, bidder_id: 1)
b2 = Bid.create(auction_id: 1, bid: 120, bidder_id: 3)
b3 = Bid.create(auction_id: 1, bid: 150, bidder_id: 4)

b4 = Bid.create(auction_id: 2, bid: 20, bidder_id: 1)
b5 = Bid.create(auction_id: 2, bid: 25, bidder_id: 2)
b6 = Bid.create(auction_id: 2, bid: 30, bidder_id: 4)

b7 = Bid.create(auction_id: 3, bid: 500, bidder_id: 2)
b7 = Bid.create(auction_id: 3, bid: 550, bidder_id: 3)
b7 = Bid.create(auction_id: 3, bid: 600, bidder_id: 4)
