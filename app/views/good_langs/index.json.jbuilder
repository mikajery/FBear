json.array!(@good_langs) do |good_lang|
  json.extract! good_lang, 
  json.url good_lang_url(good_lang, format: :json)
end
