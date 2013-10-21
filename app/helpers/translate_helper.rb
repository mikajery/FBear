module TranslateHelper
  def T key, language = false
    translation = Translation.find_by_key key

    if !language
      if !@language
        language = Language.find_by_is_default true
      else 
        language = @language
      end
    end

    if translation
      unless translation.source
        translation.update source: @current_page.name, url: request.path
      end

      Globalize.with_locale language.slug do
        value = translation.value || key
      end
    else
      Translation.create(key: key)
      key
    end
  end
end