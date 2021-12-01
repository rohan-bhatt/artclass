class MediumType < ApplicationRecord
  # Direct associations

  has_many   :artworks,
             :foreign_key => "medium_id",
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    medium
  end

end
