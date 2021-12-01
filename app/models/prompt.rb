class Prompt < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :title, :presence => true

  # Scopes

  def to_s
    title
  end

end
