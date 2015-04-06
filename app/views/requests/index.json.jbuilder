json.array!(@requests) do |request|
  json.extract! request, :id, :settle_buddy_id, :client_id, :status
  json.url request_url(request, format: :json)
end
