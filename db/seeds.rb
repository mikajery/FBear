# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Language.create([{ slug: 'en', name: 'English', abbr: 'en' }, { slug: 'ru', name: 'Русский', abbr: 'ru'} ])

ru = Language.find_by slug: 'ru'
en = Language.find_by slug: 'en'

category = Category.find_or_create_by({ slug: 'test' })

CategoryLang.find_or_create_by({
	category: category,
	language: ru,
	name: 'Интерьер'
})

CategoryLang.create({
	category: category,
	language: ru,
	name: 'Интерьер'
})

CategoryLang.find_or_create_by({
	category: category,
	language: en,
	name: 'Interior'
})

category = Category.find_or_create_by({ slug: 'taburetki' })

CategoryLang.find_or_create_by({
	category: category,
	language: ru,
	name: 'Табуретки'
})

category = Category.find_or_create_by({ slug: 'chairs' })

CategoryLang.find_or_create_by({
	category: category,
	language: en,
	name: 'Chairs'
})

Menu.find_or_create_by({
	language: en,
	name: 'Head menu',
	key: 'head_menu'
})

Menu.create({
	language: ru,
	name: 'Меню в шапке',
	key: 'head_menu'
})