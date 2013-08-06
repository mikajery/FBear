json.array!(@admin_countries) do |admin_country|
  json.extract! admin_country, :name, :code
  json.url admin_country_url(admin_country, format: :json)
end
