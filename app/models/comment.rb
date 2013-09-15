class Comment < ActiveRecord::Base
  include Languageable

  belongs_to :post
  belongs_to :comment  
end