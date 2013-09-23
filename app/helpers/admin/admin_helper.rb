module Admin::AdminHelper
  def empty_list
  	content_tag :div, 'Пусто', class: 'well'
  end

  def icon(type, white = false)
    content_tag :i, '', class: 'icon-' + type + (' icon-white' if white).to_s
  end

  def trash_icon(white = false)
    icon "trash", white
  end

  def pencil_icon(white = false)
    icon "pencil", white
  end

  def plus_icon(white = false)
    icon "plus", white
  end
end