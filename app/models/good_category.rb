class GoodCategory < Category
  has_many :goods, through: :good_categories
end
