json.extract! school, :id, :name, :description, :location, :level, :category, :avatar, :created_at, :updated_at
json.url school_url(school, format: :json)