json.array!(@projects) do |project|
  json.extract! project, :id, :title, :details
  json.url project_url(project, format: :json)
end
