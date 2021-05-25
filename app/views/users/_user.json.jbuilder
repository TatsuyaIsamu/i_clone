json.extract! user, :id, :name, :email, :password, :created_at, :updated_at, :user_image, :image_cache
json.url user_url(user, format: :json)
