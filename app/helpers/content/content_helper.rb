module Content::ContentHelper
  def page_title
  	'LLLOOCH'
  end

  def languages 
  	[
  		{
        :title  => 'EN'
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