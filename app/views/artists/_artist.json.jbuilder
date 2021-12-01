json.extract! artist, :id, :first_name, :last_name, :username, :created_at, :updated_at
json.url artist_url(artist, format: :json)
json.token user.generate_jwt