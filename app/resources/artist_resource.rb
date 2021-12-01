class ArtistResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :username, :string

  # Direct associations

  has_many   :favorited_works,
             foreign_key: :favoriter_id

  has_many   :created_works,
             resource: FavoritedWorkResource,
             foreign_key: :creator_id

  has_many   :prompts

  has_many   :artworks

  # Indirect associations

  many_to_many :favorites,
               resource: ArtworkResource

end
