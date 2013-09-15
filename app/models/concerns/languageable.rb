module Languageable
  included do 
  	belongs_to :language

    def self.get_language(lang)
      Language.find_by slug: lang
    end

    def self.by_lang(lang)
      where language_id: self.get_language(lang)
    end
  end 
end