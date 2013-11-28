class DeliveryType < ActiveRecord::Base
  include MultilingualModel
  translates :name, :conditions

  default_scope { order(:weight) }

  validates :type, presence: true, uniqueness: true
  validates :name, presence: true

  def self.types
    {
        'DeliveryType::Courier' => 'Курьером',
        'DeliveryType::Pickup' => 'Самовывоз',
        'DeliveryType::Showroom' => 'Шоурум',
        'DeliveryType::DPD' => 'DPD'
    }
  end
end
