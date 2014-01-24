# модель заказа
class Order::Robust < Order
  include OrderConcern

  validates :country, :city, :region, :street, :street_number, :zip, :payment_type, :delivery_type, presence: true, unless: -> { self.skip_validations? }
  before_update :validate_delivery

  private
  def validate_delivery
    abort self.inspect
  end
end