# todo краткое описание класса
class PostCategory < Category
  has_and_belongs_to_many :posts, join_table: :post_categories_posts

  default_scope { order(:weight) }
end
