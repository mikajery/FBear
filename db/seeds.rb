languages = YAML::load_file File.join(Rails.root, 'db', 'seeds', 'languages.yml')

languages.each do |l|
  language = Language.find_or_create_by_name l

  l.each do |k, v|
    language.update_attribute k, v
  end

  language.slug = l[:slug]
end

page_types = YAML::load_file File.join(Rails.root, 'db', 'seeds', 'page_types.yml')

page_types.each do |t|
  page_type = PageType.find_or_create_by_method t

  t.each do |k, v|
    page_type.update_attribute k, v
  end
end


colors = YAML::load_file File.join(Rails.root, 'db', 'seeds', 'blog_colors.yml')

colors.each do |t|
  color = BlogColor.find_or_create_by_name t

  t.each do |k, v|
    color.update_attribute k, v
  end
end


pages = YAML::load_file File.join(Rails.root, 'db', 'seeds', 'pages.yml')

pages.each do |t|
  t['page_type'] = PageType.find_by_name t['page_type']

  page = Page.find_or_create_by_name_and_url t

  t.each do |k, v|
    page.update_attribute k, v
  end
end

menus = YAML::load_file File.join(Rails.root, 'db', 'seeds', 'menus.yml')

menus.each do |m|
  items = m["items"]
  m.except! "items"
  
  menu = Menu.find_or_create_by_key m

  m.each do |k, v|
    menu.update_attribute k, v
  end

  items.each do |i|
    i["page"] = Page.find_by_name i['page']
    i["menu"] = menu

    menu_item = MenuItem.find_or_create_by_name i

    i.each do |k, v|
      menu_item.update_attribute k, v
    end    
  end
end
