class MediumTypeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :medium, :string

  # Direct associations

  has_many   :artworks,
             foreign_key: :medium_id

  # Indirect associations
end
