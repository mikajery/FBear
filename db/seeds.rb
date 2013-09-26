languages = YAML::load_file File.join(Rails.root, 'db', 'seeds', 'languages.yml')

languages.each do |l|
  language = Language.find_or_create_by_name l

  l.each do |k, v|
    language.update_attribute k, v
  end
end
