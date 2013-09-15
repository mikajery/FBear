class MenuItem < ActiveRecord::Base
  belongs_to :menu
  belongs_to :language
  belongs_to :template
end
