class FavoritedWork < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    artwork.to_s
  end

end
