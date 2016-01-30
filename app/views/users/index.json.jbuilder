json.array!(@users) do |user|
  json.extract! user, :id, :name, :theid, :bio
  json.url user_url(user, format: :json)
end
