json.array!(@posts) do |post|
  json.color post.color.color
  json.url post_item_path(post.slug)
  json.picture image_url(post.picture.url(:preview))
  json.title post.title
  json.announce post.announce.truncate(300).html_safe if post.announce
  json.category post.category.name unless post.category.nil?
  json.category_url '#' + post.category.slug
end
