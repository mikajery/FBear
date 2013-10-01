module Content::ContentHelper
  def page_title
    ''
  end

  def menu key
    Menu.find_by_key key
  end

  def languages
    Language.all
  end
end
