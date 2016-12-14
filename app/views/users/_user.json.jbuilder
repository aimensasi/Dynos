json.extract! user, :id, :first_name, :last_name, :email, :location, :avatar, :created_at, :updated_at
json.url user_url(user, format: :json)