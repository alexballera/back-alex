json.array!(@articles) do |article|
  json.extract! article, :id, :title, :description, :user_id, :image, :urlgit, :urlweb, :urlimg
  json.url article_url(article, format: :json)
end
