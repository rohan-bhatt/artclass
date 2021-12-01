json.extract! favorited_work, :id, :artwork_id, :creator_id, :favoriter_id,
              :created_at, :updated_at
json.url favorited_work_url(favorited_work, format: :json)
