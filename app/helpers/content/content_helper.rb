module Content::ContentHelper
  def meta
    controller.meta
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
    Language.all
  end
end
