# модель заказа
class Order::Robust < Order
  include OrderConcern

  validates :country, :city, :region, :address, :zip, :payment_type, :delivery_type, presence: true, unless: -> { self.skip_validations? }
end