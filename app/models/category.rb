class Category < ActiveRecord::Base
  include Multilingual
  belongs_to :category
end
