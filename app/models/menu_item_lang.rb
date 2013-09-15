class MenuItemLang < ActiveRecord::Base
  belongs_to :menu_item
  belongs_to :language

  validates_uniqueness_of :menu_item, :scope => :language
end
