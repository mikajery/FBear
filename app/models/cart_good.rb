class CartGood < ActiveRecord::Base
  belongs_to :cart
  belongs_to :good
  belongs_to :good_option

  def self.from_good good
    self.new({
      good: good,
      price: good.price,
      quantity: 1
    })
  end
end