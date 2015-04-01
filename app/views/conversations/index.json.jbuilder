json.array!(@conversations) do |conversation|
  json.extract! conversation, :id, :receipent_id, :sender_id, :user_id
  json.url conversation_url(conversation, format: :json)
end
