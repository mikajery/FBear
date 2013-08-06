class Admin::Country < ActiveRecord::Base
  has_and_belongs_to_many :admin_languages, :class_name => 'Admin::Language'

  validates :name, :code, presence: true
  validates :name, :code, uniqueness: true
end
