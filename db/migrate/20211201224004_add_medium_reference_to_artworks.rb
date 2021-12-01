class AddMediumReferenceToArtworks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :artworks, :medium_types, column: :medium_id
    add_index :artworks, :medium_id
  end
end
