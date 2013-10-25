class PostBlock < ActiveRecord::Base
  include MultilingualModel
  belongs_to :post

  default_scope { order(:weight) }

  translates :content

  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png','image/gif']

  has_attached_file :picture,
                    styles: {preview: "370x370#"},
                    default_url: "/images/:style/missing.png",
                    url: "/uploads/post_blocks/:id/:style/:basename.:extension",
                    path: ":rails_root/public/uploads/post_blocks/:id/:style/:basename.:extension"
end
