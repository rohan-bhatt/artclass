class Artwork < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :image, :presence => true

  # Scopes

  def to_s
    created_at
  end

end
