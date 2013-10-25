class PostBlock < ActiveRecord::Base
  include MultilingualModel
  belongs_to :post

  translates :content

  default_scope { order(:weight) }

  def block_type
    type.split('::').last.downcase
  end
end
