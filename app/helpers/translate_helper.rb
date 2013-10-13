module TranslateHelper
  def T key
    translation = Translation.find_by_key key

    if translation
      Globalize.with_locale @language.slug do
        value = translation.value || key
      end
    else
      Translation.create(key: key)
      key
    end
  end
end