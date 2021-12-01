class Artwork < ApplicationRecord
  # Direct associations

  belongs_to :medium,
             :required => false,
             :class_name => "MediumType"

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

  has_many   :fans,
             :through => :favorites,
             :source => :favoriter

  # Validations

  validates :image, :presence => true

  # Scopes

  def to_s
    created_at
  end

end
