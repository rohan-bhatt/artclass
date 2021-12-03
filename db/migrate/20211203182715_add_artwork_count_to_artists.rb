class AddArtworkCountToArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :artworks_count, :integer
  end
end
