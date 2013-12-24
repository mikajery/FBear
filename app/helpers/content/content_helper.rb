# todo подробное описание модуля 
module Content::ContentHelper
  def language_alternate
    render 'content/parts/language_alternate', languages: Language.active
  end

  def meta
    controller.meta
  end

  def switch_locale locale
    params["locale"] = locale
    url_for params
  end

  def menu key
    Menu.find_by_key key
  end

  def S key
    setting = Setting.find_by_key key

    if setting
      setting.value
    else
      nil
    end
  end

  def phones
    phones = Setting.find_by_key('phones')

    if phones
      Globalize.with_locale @language.slug do
        phones.value.split("\n") if phones.value
      end
    else
      []
    end
  end

  def languages
    Language.active
  end
end
