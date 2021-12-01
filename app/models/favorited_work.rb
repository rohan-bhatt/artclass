class FavoritedWork < ApplicationRecord
  # Direct associations

  belongs_to :artwork,
             :counter_cache => :favorites_count

  belongs_to :favoriter,
             :class_name => "Artist"

  belongs_to :creator,
             :class_name => "Artist"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    artwork.to_s
  end

end
