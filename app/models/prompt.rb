class Prompt < ApplicationRecord
  # Direct associations

  has_many   :artworks,
             dependent: :nullify

  belongs_to :prompter,
             class_name: "Artist",
             foreign_key: "artist_id"

  # Indirect associations

  # Validations

  validates :body, presence: true

  validates :title, presence: true

  # Scopes

  def to_s
    title
  end
end
