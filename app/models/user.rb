require 'BCrypt'

class User < ActiveRecord::Base
include BCrypt

  has_many  :bids, class_name: :Bid, foreign_key: :bidder_id
  has_many  :auctions, foreign_key: :seller_id

  validates :email, presence:true, uniqueness:true, format: { with: /\S+@\S+/, message: "Not valid email address." }
  validates_presence_of :username, uniqueness:true
  validates_presence_of :hashed_password
  validate :password_longer_than_six

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @plaintext = new_password
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email,password)
    @user = User.find_by(email:email)
    return nil unless @user
    if @user.password == password
      return @user
    end
  end

  def password_longer_than_six
    if @plaintext.length < 6
      self.errors.add(:password, "must be at least six characters")
    end
  end

end

