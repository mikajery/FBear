class PostCategory < Category
  has_many :posts

  default_scope { order(:weight) }
end
