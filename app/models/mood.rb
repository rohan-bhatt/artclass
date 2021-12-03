class Mood < ApplicationRecord
  # Direct associations

  has_many   :artworks,
             dependent: :nullify

  # Indirect associations

  has_many   :artists,
             through: :artworks,
             source: :artist

  # Validations

  # Scopes

  def to_s
    mood
  end
end
