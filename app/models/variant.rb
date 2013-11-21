class Variant < ActiveRecord::Base
  include MultilingualModel
  translates :price, :name

  default_scope { order('weight ASC') }

  belongs_to :good
  has_many :variant_properties, dependent: :destroy

  validates :price, presence: true

  validates :picture, :attachment_presence => true
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png','image/gif']

  has_attached_file :picture,
    styles: {preview: "300x300#", cart: "400x400#", additional: "90x90#", admin: "30x30#"},
    default_url: "/images/:style/missing.png",
    url: "/uploads/goods/variants/:id/:style/:basename.:extension",
    path: ":rails_root/public/uploads/goods/variants/:id/:style/:basename.:extension"

  validates_attachment_content_type :material, :content_type => ['image/jpeg', 'image/png','image/gif']

  has_attached_file :material,
                    styles: {preview: "300x300#", cart: "400x400#", additional: "90x90#", admin: "30x30#", material: "450x450#"},
                    default_url: "/images/:style/missing.png",
                    url: "/uploads/goods/variants/:id/:style/:basename.:extension",
                    path: ":rails_root/public/uploads/goods/variants/:id/:style/:basename.:extension"

  def full_article
    [good.article, self.suffix].join "." if self.suffix.present?
  end

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

    unless self.name
      update name: variant_name.join(", ") 
    end
  end
end
