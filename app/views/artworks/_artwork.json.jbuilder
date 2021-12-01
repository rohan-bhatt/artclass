json.extract! artwork, :id, :image, :artist_id, :title, :description, :dimensions_height, :dimensions_width, :medium_id, :mood_id, :prompt_id, :created_at, :updated_at
json.url artwork_url(artwork, format: :json)
