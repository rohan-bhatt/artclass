class PromptResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :title, :string
  attribute :body, :string
  attribute :artist_id, :integer

  # Direct associations

  has_many   :artworks

  belongs_to :prompter,
             resource: ArtistResource,
             foreign_key: :artist_id

  # Indirect associations

end
