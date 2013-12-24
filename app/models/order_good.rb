# todo краткое описание класса
class OrderGood < ActiveRecord::Base
  belongs_to :order
  belongs_to :good
  belongs_to :variant

  validates :good, presence: true
  validates :order, presence: true

  delegate :name, :slug, to: :good, prefix: true, allow_nil: true

  # creates instance from good
  def self.from_good good
    self.new(good: good, quantity: 1, price: good.price)
  end
end
