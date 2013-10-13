module Content::ContentHelper
  def meta
    controller.meta
  end

  def menu key
    Menu.find_by_key key
  end

  def phones
    phones = Setting.find_by_key('phones')

    if phones
      phones.value.split "\n"
    else
      []
    end
  end

  def languages
    Language.all
  end
end
