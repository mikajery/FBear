class Content::BaseController < ApplicationController
  layout 'content'
  helper Content::ContentHelper

  def getNavigation 
  	{
		  title:  'Выберите категорию товара',
		  search: true,
		  links:  [
		    {
		      title: 'Все товары',
		      active: true,
		      link:  '#'
		    },
		    {
		      title: 'Освещение',
		      link:  '#'
		    },
		    {
		      title: 'Без батареек',
		      link:  '#'
		    },
		    {
		      title: 'Детские товары',
		      link:  '#'
		    },
		    {
		      title: 'Стулья / табуретки',
		      link:  '#'
		    },
		    {
		      title: 'Системы хранения',
		      link:  '#'
		    },
		    {
		      title: 'Столы',
		      link:  '#'
		    },
		    {
		      title: 'Кабинет',
		      link:  '#'
		    },
		    {
		      title: 'Аксессуары для тв',
		      link:  '#'
		    },
		    {
		      title: 'Все для интерьера',
		      link:  '#'
		    }
		  ]
		}
  end

  def getPromo
  	{
  		pic:  "content/promo/1.jpg",
  		logo: "content/logo/1.png",
  		desc: "An extendable TV stand or storage unit. <br />May be adjusted to varied lengths (1m – 1.4m). 100% pinewood"
  	}
  end

  def getCartItems 
  	[
  		{
  			title: 'Diesel',
  			pic:   'content/product/2.jpg',
  			options:     self.getCartOptions("Diesel"),
  			additionals: self.getCartAdditionals("Diesel")
  		},
  		{
  			title: 'Moo',
  			pic:   'content/product/2.jpg',
  			options:     self.getCartOptions("Moo"),
  			additionals: self.getCartAdditionals("Moo")
  		}
  	]
  end

  def getCartAdditionals(key)
  	[
  		{
  			title: 'USB Apple',
  			pic:   'content/product/thumb/1.jpg',
  			desc:  'Такой маленький кабель, чтобы телефон от стула заряжать.'
  		}
  	]
  end

  def getCartOptions(key)
  	[
  		{
  			title: "Материал",
  			items: [
  				{
  					title: "Материал 1"
  				},
  				{
  					title: "Материал 2"
  				},
  				{
  					title: "Материал 3"
  				}
  			]
  		},
  		{
  			title: "Ориентация",
  			items: [
  				{
  					title: "Ориентация 1"
  				},
  				{
  					title: "Ориентация 2"
  				},
  				{
  					title: "Ориентация 3"
  				}
  			]
  		}
  	]
  end

  def getItems
		[
			{
				pic:  'content/product/2.jpg',
				logo: 'content/logo/2.jpg'
			},
			{
				pic:  'content/product/3.jpg',
				logo: 'content/logo/3.jpg'
			},
			{
				pic:  'content/product/4.jpg',
				logo: 'content/logo/4.png'
			},
			{
				pic:  'content/product/5.jpg',
				logo: 'content/logo/5.jpg'
			},
			{
				pic:  'content/product/6.jpg',
				logo: 'content/logo/6.jpg'
			},
			{
				pic:  'content/product/7.jpg',
				logo: 'content/logo/7.jpg'
			},
			{
				pic:  'content/product/1.jpg',
				logo: 'content/logo/1.jpg'
			},
			{
				pic:  'content/product/8.jpg',
				logo: 'content/logo/8.jpg'
			}
		]
  end

  def getResults 
  	[
      {
        picture:  'content/search/1.jpg',
        title:    'Как думают пользователи?',
        location: 'Найдено в блогах',
        content:  'В принципе, поведение пользователей на веб-сайте не особо отличаются от их поведения в, скажем, магазине. На самом деле, на большую часть страницы они даже не посмотрят.'
      },

      {
        picture:  'content/search/2.jpg',
        title:    'Moo',
        location: 'Найдено в продуктах',
        content:  'Очень простой принцип: если веб-сайт не может оправдать ожиданий пользователей, то дизайн не выполняет свою функцию, а компания теряет деньги. Чем менее интуитивная навигация, тем сильнее желание пользователя покинуть веб-сайт и найти альтернативу.'
      },

      {
        picture:  'content/search/3.jpg',
        title:    'Оптимальные решения',
        location: 'Найдено в блогах',
        content:  'Пользователи не ищут самый быстрый способ для поиска желаемой информации. Они также не сканируют веб-сайты последовательно, переходя от одного раздела к другому. '
      }
    ]
  end
	
end