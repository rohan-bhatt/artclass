class FavoritedWork < ApplicationRecord
  # Direct associations

  belongs_to :creator,
             :class_name => "Artist"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    artwork.to_s
  end

end
