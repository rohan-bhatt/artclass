class Mood < ApplicationRecord
  # Direct associations

  has_many   :artworks,
             dependent: :nullify

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    mood
  end
end
