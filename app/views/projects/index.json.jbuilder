json.array!(@projects) do |project|
  json.extract! project, :id, :title, :description, :user_id, :image, :urlgit, :urlweb, :urlimg
  json.url project_url(project, format: :json)
end
