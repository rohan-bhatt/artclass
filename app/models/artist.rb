class Artist < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :favorited_works,
             foreign_key: "favoriter_id",
             dependent: :nullify

  has_many   :prompts,
             dependent: :nullify

  has_many   :artworks,
             dependent: :destroy

  # Indirect associations

  has_many   :moods,
             through: :artworks,
             source: :mood

  has_many   :favorites,
             through: :favorited_works,
             source: :artwork

  has_many   :media,
             through: :artworks,
             source: :medium

  # Validations

  validates :username, presence: true

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
