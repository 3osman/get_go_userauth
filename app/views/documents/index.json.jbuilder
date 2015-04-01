json.array!(@documents) do |document|
  json.extract! document, :id, :name, :description, :task_id
  json.url document_url(document, format: :json)
end
