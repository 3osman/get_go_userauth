json.array!(@settlebuddy_supports) do |settlebuddy_support|
  json.extract! settlebuddy_support, :id, :bank, :visa, :housing, :public_transport, :caf, :telecommunication, :user_id
  json.url settlebuddy_support_url(settlebuddy_support, format: :json)
end
