class Artwork < ApplicationRecord
  # Direct associations

  belongs_to :artist,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :image, :presence => true

  # Scopes

  def to_s
    created_at
  end

end
