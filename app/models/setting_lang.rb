class SettingLang < ActiveRecord::Base
  belongs_to :language
  belongs_to :setting

  validates_uniqueness_of :setting, :scope => :language
end
