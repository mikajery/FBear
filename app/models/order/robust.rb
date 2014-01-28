# модель заказа
class Order::Robust < Order
  include OrderConcern

  validates :country, :city, :street, :street_number, :zip, :payment_type, :delivery_type, presence: true, unless: -> { self.skip_validations? }
  before_update :validate_delivery

  before_validation :set_country

  private
  def set_country
    write_attribute(:country, :RU)
  end

  def validate_delivery
    abort self.inspect
  end
end