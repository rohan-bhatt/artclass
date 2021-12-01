class MoodResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :mood, :string

  # Direct associations

  has_many :artworks

  # Indirect associations
end
