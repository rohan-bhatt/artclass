class FavoritedWorkResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :artwork_id, :integer
  attribute :favoriter_id, :integer

  # Direct associations

  belongs_to :artwork

  belongs_to :favoriter,
             resource: ArtistResource

  # Indirect associations
end
