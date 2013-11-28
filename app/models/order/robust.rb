# модель заказа
class Order::Robust < Order
  include OrderConcern

  validates :country, presence: true
  validates :city, presence: true
  validates :region, presence: true
  validates :address, presence: true
  validates :zip, presence: true

  validates :payment_type, presence: true
  validates :delivery_type, presence: true

end