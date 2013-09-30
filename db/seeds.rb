languages = YAML::load_file File.join(Rails.root, 'db', 'seeds', 'languages.yml')

languages.each do |l|
  language = Language.find_or_create_by_name l

  l.each do |k, v|
    language.update_attribute k, v
  end
end

page_types = YAML::load_file File.join(Rails.root, 'db', 'seeds', 'page_types.yml')

page_types.each do |t|
  page_type = PageType.find_or_create_by t

  t.each do |k, v|
    page_type.update_attribute k, v
  end
end
