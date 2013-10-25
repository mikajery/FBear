class PostBlock < ActiveRecord::Base
  include MultilingualModel
  belongs_to :post

  default_scope { order(:weight) }

  def block_type
    type.split('::').last.downcase
  end
end
