class Language < ActiveRecord::Base
  include SortedByName
  include MultilingualModel
  include SluggableModel
  include AutotitleableModel

  default_scope { order('is_default DESC') }

  translates :title
  validates :name, presence: true

  after_save :check_defaultness

  def check_defaultness
    if is_default == true
      Language.where('id <> ?', id).each do |l|
        l.update_columns({is_default: false})
      end
    end
  end
end
