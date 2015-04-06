json.array!(@document_comments) do |document_comment|
  json.extract! document_comment, :id, :comment, :task_id, :rating
  json.url document_comment_url(document_comment, format: :json)
end
