module Multilingual
  extend ActiveSupport::Concern

  included do
    has_many :translations, class_name: self.name + 'Lang'

    def self.translations
      self.name.downcase + '_langs'
    end

    def self.get_language(lang)
      Language.find_by slug: lang
    end

    def self.by_lang(lang)
      includes(:translations).where self.translations => {language_id: self.get_language(lang)}
    end
  end

  def lang(lang)
    language = self.class.get_language(lang)
    self.translations.select { |t| t.language_id == language.id}.first
  end
end