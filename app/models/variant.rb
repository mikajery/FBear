class Variant < ActiveRecord::Base
  include MultilingualModel
  translates :price

  belongs_to :good
  has_many :variant_properties

  def properties
    variant_properties
  end
end
