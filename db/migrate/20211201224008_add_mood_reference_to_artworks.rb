class AddMoodReferenceToArtworks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :artworks, :moods
    add_index :artworks, :mood_id
  end
end
