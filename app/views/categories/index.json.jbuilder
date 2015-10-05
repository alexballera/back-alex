json.array!(@categories) do |category|
  json.extract! category, :id, :title, :description, :article, :project
  json.url category_url(category, format: :json)
end
