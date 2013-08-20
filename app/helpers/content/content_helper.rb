module Content::ContentHelper
  def page_title
  	'LLLOOCH'
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