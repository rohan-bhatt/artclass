class MediumType < ApplicationRecord
  # Direct associations

  has_many   :artworks,
             foreign_key: "medium_id",
             dependent: :nullify

  # Indirect associations

  has_many   :artists,
             through: :artworks,
             source: :artist

  # Validations

  # Scopes

  def to_s
    medium
  end
end
