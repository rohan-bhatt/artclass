class AddArtworkReferenceToFavoritedWorks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :favorited_works, :artworks
    add_index :favorited_works, :artwork_id
    change_column_null :favorited_works, :artwork_id, false
  end
end
