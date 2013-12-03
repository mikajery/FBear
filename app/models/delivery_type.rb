class DeliveryType < ActiveRecord::Base
  include MultilingualModel
  translates :name, :conditions

  has_and_belongs_to_many :payment_types

  default_scope { order(:weight) }

  scope :active, -> { where(is_active: true) }

  validates :type, presence: true, uniqueness: true
  validates :name, presence: true
  validates :layout, presence: true

  def options
    {
        name: self.name,
        conditions: self.conditions,
        price: self.price,
        layout: self.layout,
        payment_types: self.payment_types.map(&:id)
    }
  end

  def self.types
    {
        'DeliveryType::Courier' => 'Курьером',
        'DeliveryType::Pickup' => 'Самовывоз',
        'DeliveryType::Showroom' => 'Шоурум',
        'DeliveryType::Dpd' => 'DPD'
    }
  end

  def self.layouts
    {
        'address_and_payment' => 'Адрес/Оплата',
        'payment' => 'Оплата'
    }
  end
end
