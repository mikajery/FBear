languages = YAML::load_file File.join(Rails.root, 'db', 'seeds', 'languages.yml')

languages.each do |l|
  language = Language.find_or_create_by_name l
  language.update l
end

page_types = YAML::load_file File.join(Rails.root, 'db', 'seeds', 'page_types.yml')

page_types.each do |t|
  page_type = PageType.find_or_create_by_method t
  page_type.update t
end


colors = YAML::load_file File.join(Rails.root, 'db', 'seeds', 'blog_colors.yml')

colors.each do |t|
  color = BlogColor.find_or_create_by_name t
  color.update t
end


pages = YAML::load_file File.join(Rails.root, 'db', 'seeds', 'pages.yml')

pages.each do |t|
  t['page_type'] = PageType.find_by_name t['page_type']

  page = Page.find_or_create_by_name_and_url t
  page.update t
end

menus = YAML::load_file File.join(Rails.root, 'db', 'seeds', 'menus.yml')

menus.each do |m|
  items = m["items"]
  m.except! "items"
  
  menu = Menu.find_or_create_by_key m
  menu.update m

  items.each do |i|
    i["page"]  = Page.find_by_name i['page']
    i["menu"]  = menu
    i["title"] = i["name"]

    menu_item = MenuItem.find_or_create_by_name i
    menu_item.update i
  end
end

delivery_types = YAML::load_file File.join(Rails.root, 'db', 'seeds', 'delivery_types.yml')

delivery_types.each do |type|
  DeliveryType.find_or_create_by type
end

payment_types = YAML::load_file File.join(Rails.root, 'db', 'seeds', 'payment_types.yml')

payment_types.each do |type|
  PaymentType.find_or_create_by type
end