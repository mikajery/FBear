class Admin::Language < ActiveRecord::Base
  has_and_belongs_to_many :admin_countries, :class_name => 'Admin::Country'

  validates :name, :code, presence: true
  validates :name, :code, uniqueness: true
end
