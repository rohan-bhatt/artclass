json.extract! prompt, :id, :title, :body, :artist_id, :created_at, :updated_at
json.url prompt_url(prompt, format: :json)
