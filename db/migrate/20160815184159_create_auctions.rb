class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string  :name
      t.string  :description
      t.integer :seller_id
      t.integer :highest_bid_id
      t.string  :end_date
      t.integer :category_id

      t.timestamps(null: false)
    end
  end
end
