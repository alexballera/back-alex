json.array!(@categories) do |category|
  json.extract! category, :id, :title, :article, :project
  json.url category_url(category, format: :json)
end
