class PaymentType < ActiveRecord::Base
  include MultilingualModel
  translates :name

  default_scope { order(:weight) }

  scope :active, -> { where(is_active: true) }

  validates :type, presence: true, uniqueness: true
  validates :name, presence: true

  def options
    {
        name: self.name
    }
  end

  def self.types
    {
        'PaymentType::Cash' => 'Наличные',
        'PaymentType::Noncash' => 'Безнал'
    }
  end
end
