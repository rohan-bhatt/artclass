class Artist < ApplicationRecord
  # Direct associations

  has_many   :created_works,
             :class_name => "FavoritedWork",
             :foreign_key => "creator_id",
             :dependent => :destroy

  has_many   :prompts,
             :dependent => :nullify

  has_many   :artworks,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :username, :presence => true

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
