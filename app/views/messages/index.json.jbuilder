json.array!(@messages) do |message|
  json.extract! message, :id, :body, :conversation_id
  json.url message_url(message, format: :json)
end
