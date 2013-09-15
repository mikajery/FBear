class MenuItemLang < ActiveRecord::Base
  belongs_to :menu_item
  belongs_to :language
end
