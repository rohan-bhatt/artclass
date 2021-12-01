class Prompt < ApplicationRecord
  # Direct associations

  belongs_to :prompter,
             :class_name => "Artist",
             :foreign_key => "artist_id"

  # Indirect associations

  # Validations

  validates :body, :presence => true

  validates :title, :presence => true

  # Scopes

  def to_s
    title
  end

end
