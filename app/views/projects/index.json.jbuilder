json.array!(@projects) do |project|
  json.extract! project, :id, :title, :description, :image, :urlgit, :urlweb, :urlimg
  json.url project_url(project, format: :json)
end
