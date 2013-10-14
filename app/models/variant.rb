class Variant < ActiveRecord::Base
  include MultilingualModel
  translates :price, :name

  belongs_to :good
  has_many :variant_properties, dependent: :destroy

  validates :price, presence: true

  def properties
    variant_properties
  end

  def property_types= types
    variant_name = []
    properties.delete_all

    types.each do |k, v|
      property = Property.find v
      variant_name << property.name
      VariantProperty.create property: property, variant: self
    end

    unless name
      update name: variant_name.join("/") 
    end
  end
end
