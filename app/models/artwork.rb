class Artwork < ApplicationRecord
  # Direct associations

  has_many   :favorites,
             :class_name => "FavoritedWork",
             :dependent => :destroy

  belongs_to :mood,
             :required => false

  belongs_to :prompt,
             :required => false,
             :counter_cache => true

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
