class Language < ActiveRecord::Base
  include MultilingualModel
  include SluggableModel
  include AutotitleableModel

  translates :title
  validates :name, presence: true

  after_save :check_defaultness

  def check_defaultness
    Language.where('id <> ?', id).each do |l|
      l.update_columns({is_default: false})
    end
  end
end
