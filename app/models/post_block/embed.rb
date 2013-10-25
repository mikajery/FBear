class PostBlock::Embed < PostBlock
  validates :content, presence: true, on: :update

  translates :content
end
