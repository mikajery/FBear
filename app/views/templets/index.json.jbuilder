json.array!(@templets) do |templet|
  json.extract! templet, 
  json.url templet_url(templet, format: :json)
end
