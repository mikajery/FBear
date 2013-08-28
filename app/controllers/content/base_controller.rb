class Content::BaseController < ApplicationController
  layout 'content'
  helper Content::ContentHelper

  def getDesigners
    [
      {
        title: 'Антон Цибарев',
        motto: 'Разрушая стереотип, сохраняй традицию',
        pic:   'content/designer/1.jpg',
        desc:  '<p>Родился и вырос в Зеленограде. В 2011 году с отличием закончил МИЭТ по специальности «промышленный дизайнер». Сформулировал для себя два подхода к профессии. Первое: внешний вид предмета - это инструмент, благодаря которому дизайнер может вызвать у зрителя те или иные эмоции. И второе: у русских нет привычки печься о комфорте и технологичности, поэтому русские традиции необходимо скрещивать с европейским качеством и азиатской страстью к инновациям. В LLLdesign пришел с намерением создавать именно такие вещи.</p><div class="clearfix"></div><p>Я много путешествовал по России, складывая свое собственное восприятие национального быта. «Астрахань отличается от Норильска примерно так же сильно, как Греция отличается от Гренландии. Русская природа необычайно разнообразна – значит, разнообразным должен быть и русский дизайн».</p>',
        projects: [
          {
            pic: 'content/product/2.jpg'
          },
          {
            pic: 'content/product/3.jpg'
          },
          {
            pic: 'content/product/4.jpg'
          },
          {
            pic: 'content/product/5.jpg'
          }
        ]
      },
      {
        title: 'Антон Цибарев',
        pic:   'content/designer/2.jpg'
      },
      {
        title: 'Антон Цибарев',
        pic:   'content/designer/3.jpg'
      },
      {
        title: 'Антон Цибарев',
        pic:   'content/designer/4.jpg'
      },
      {
        title: 'Антон Цибарев',
        pic:   'content/designer/5.jpg'
      },
      {
        title: 'Антон Цибарев',
        pic:   'content/designer/6.jpg'
      },
      {
        title: 'Антон Цибарев',
        pic:   'content/designer/7.jpg'
      },
      {
        title: 'Антон Цибарев',
        pic:   'content/designer/2.jpg'
      },
      {
        title: 'Антон Цибарев',
        pic:   'content/designer/3.jpg'
      },
      {
        title: 'Антон Цибарев',
        pic:   'content/designer/4.jpg'
      },
      {
        title: 'Антон Цибарев',
        pic:   'content/designer/5.jpg'
      },
      {
        title: 'Антон Цибарев',
        pic:   'content/designer/6.jpg'
      },
      {
        title: 'Антон Цибарев',
        pic:   'content/designer/7.jpg'
      }
    ]
  end

  def getBlogsItems
    [
      {
        pic:  'content/blog/1.jpg'
      },
      {
        pic:  'content/blog/2.jpg'
      },
      {
        pic:  'content/blog/3.jpg'
      },
      {
        pic:  'content/blog/4.jpg'
      },
      {
        pic:  'content/blog/5.jpg'
      },
      {
        pic:  'content/blog/6.jpg'
      },
      {
        pic:  'content/blog/7.jpg'
      },
      {
        pic:  'content/blog/8.jpg'
      },
      {
        pic:  'content/blog/9.jpg'
      },
      {
        pic:  'content/blog/10.jpg'
      }
    ]
  end

  def getBlogsNavigation 
    {
      helper: 'Теги',
      title:  'Выберите категорию блога',
      search: 'Поиск по блогам',
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

  def getCatalogNavigation 
  	{
      helper: 'Категории',
		  title:  'Выберите категорию товара',
		  search: 'Поиск по каталогу',
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

  def getCatalogPromo
  	{
  		pic:  "content/promo/1.jpg",
  		logo: "content/logo/1.png",
  		desc: "An extendable TV stand or storage unit. <br />May be adjusted to varied lengths (1m – 1.4m). 100% pinewood"
  	}
  end

  def getCartItems 
  	[
  		{
  			title:       'Diesel',
  			pic:         'content/product/2.jpg',
        desc:        'Пользователи не ищут самый быстрый способ для поиска желаемой информации. Они также не сканируют веб-сайты последовательно, переходя от одного раздела к другому.',
  			options:     self.getCartOptions("Diesel"),
  			additionals: self.getCartAdditionals("Diesel")
  		},
  		{
  			title:       'Moo',
  			pic:         'content/product/3.jpg',
        desc:        'Пользователи не ищут самый быстрый способ для поиска желаемой информации. Они также не сканируют веб-сайты последовательно, переходя от одного раздела к другому.',
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

  def getCatalogItems
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

  def getSearchResults 
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