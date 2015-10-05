json.array!(@articles) do |article|
  json.extract! article, :id, :title, :description, :image, :urlgit, :urlweb, :urlimg, :category
  json.url article_url(article, format: :json)
end
