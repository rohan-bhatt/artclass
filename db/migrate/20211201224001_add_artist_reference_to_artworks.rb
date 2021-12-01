class AddArtistReferenceToArtworks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :artworks, :artists
    add_index :artworks, :artist_id
    change_column_null :artworks, :artist_id, false
  end
end
