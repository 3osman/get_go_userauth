json.array!(@roadmaps) do |roadmap|
  json.extract! roadmap, :id, :user_id, :rating, :country
  json.url roadmap_url(roadmap, format: :json)
end
