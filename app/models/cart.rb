class Cart < ActiveRecord::Base
  belongs_to :status
  belongs_to :payment

  has_many :cart_goods, autosave: true

  validates :key, presence: true, uniqueness: true

  def items
    cart_goods
  end

  def self.token
    o   = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    (0...50).map{ o[rand(o.length)] }.join
  end
end
