class DeliveryType < ActiveRecord::Base
  include MultilingualModel
  translates :name, :conditions

  has_and_belongs_to_many :payment_types

  default_scope { order(:weight) }

  scope :active, -> { where(is_active: true) }

  validates :type, presence: true, uniqueness: true
  validates :name, presence: true

  def self.types
    {
        'DeliveryType::Courier' => 'Курьером',
        'DeliveryType::Pickup' => 'Самовывоз',
        'DeliveryType::Showroom' => 'Шоурум',
        'DeliveryType::Dpd' => 'DPD'
    }
  end
end
