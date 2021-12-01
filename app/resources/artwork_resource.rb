class ArtworkResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :image, :string
  attribute :artist_id, :integer
  attribute :title, :string
  attribute :description, :string
  attribute :dimensions_height, :float
  attribute :dimensions_width, :float
  attribute :medium_id, :integer
  attribute :mood_id, :integer
  attribute :prompt_id, :integer

  # Direct associations

  belongs_to :medium,
             resource: MediumTypeResource

  has_many   :favorites,
             resource: FavoritedWorkResource

  belongs_to :mood

  belongs_to :prompt

  belongs_to :artist

  # Indirect associations

end
