class Auction < ActiveRecord::Base
  belongs_to :user
  has_many :pledges

    validates :title, presence: true
    validates :reserve_price, presence: true, 
              numericality: {greater_than_or_equal_to: 10}

end
