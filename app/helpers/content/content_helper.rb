module Content::ContentHelper
  def page_title
  	'LLLOOCH'
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

  def languages
    [
      {
        :title  => 'Английский',
        :short  => 'en',
      }
    ]
  end

  def languages_select
  	[
  		{
        :title  => 'Русский',
        :short  => 'ru',
      },
      {
        :title  => 'Английский',
        :short  => 'en',
      },
      {
        :title  => 'Французский',
        :short  => 'fr',
      },
      {
        :title  => 'Немецкий',
        :short  => 'de',
      },
      {
        :title  => 'Японский',
        :short  => 'jp',
      },

      # doubled for scroll testing
      {
        :title  => 'Русский',
        :short  => 'ru',
      },
      {
        :title  => 'Английский',
        :short  => 'en',
      },
      {
        :title  => 'Французский',
        :short  => 'fr',
      },
      {
        :title  => 'Немецкий',
        :short  => 'de',
      },
      {
        :title  => 'Японский',
        :short  => 'jp',
      }
    ]
  end

  def content_menu
  	[
  		{
        :title  => 'Коллекция',
        :active => true
      },
      {
        :title  => 'Кто мы'
      },
      {
        :title  => 'Как купить'
      },
      {
        :title  => 'Блог'
      },
      {
        :title  => 'Контакты'
      }
  	]
  end
end