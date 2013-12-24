# todo краткое описание класса
class Post < ActiveRecord::Base
  include SortedByName  
  include MultilingualModel
  include AutotitleableModel
  include SluggableModel
  
  translates :announce, :title, :heading, :keywords, :description, :content

  default_scope { order(:weight) }

  has_many :post_comments
  has_many :post_blocks

  has_and_belongs_to_many :post_categories, join_table: :post_categories_posts
  belongs_to :blog_color

  validates :name, presence: true

  attr_accessor :picture

  validates :picture, :attachment_presence => true
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png','image/gif']

  has_attached_file :picture, 
    styles: {admin: "30x30#", preview: "400x400#"},
    default_url: "/images/:style/missing.png",
    url: "/uploads/blogs/:id/:style/:basename.:extension",
    path: ":rails_root/public/uploads/blogs/:id/:style/:basename.:extension"

  def grouped_blocks
    grouped = []

    blocks.each do |b|
      block = {block: b, type: b.block_type}

      if 'picture' == b.block_type
        if grouped.last.kind_of?(Hash) and grouped.last[:type] == 'picture'
        else
          grouped << {type: 'picture', items: []}
        end

        grouped.last[:items] << block
      elsif 'html' == b.block_type
        if grouped.last.kind_of?(Hash) and grouped.last[:type] == 'html'
        else
          grouped << {type: 'html', items: []}
        end

        grouped.last[:items] << block
      else
        grouped << block
      end
    end

    grouped
  end

  def blocks
    post_blocks
  end

  def categories
    post_categories
  end

  def color
    blog_color
  end

  def comments
    post_comments
  end
end
