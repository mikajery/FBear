class GoodCategory < Category
  has_many :goods, through: :category_goods
  has_many :category_goods
end
