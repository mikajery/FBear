module Content::ContentHelper
  def meta
    controller.meta
  end

  def menu key
    Menu.find_by_key key
  end

  def languages
    Language.all
  end
end
