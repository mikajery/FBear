class Comment < ActiveRecord::Base
  module Languageable

  belongs_to :post
  belongs_to :comment  
end