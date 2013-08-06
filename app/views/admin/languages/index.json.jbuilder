json.array!(@admin_languages) do |admin_language|
  json.extract! admin_language, :name, :code
  json.url admin_language_url(admin_language, format: :json)
end
