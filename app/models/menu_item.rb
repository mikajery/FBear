class MenuItem < ActiveRecord::Base
  include Multilingual
  belongs_to :menu
  belongs_to :template
end
