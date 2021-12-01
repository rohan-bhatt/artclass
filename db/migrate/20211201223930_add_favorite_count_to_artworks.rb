class AddFavoriteCountToArtworks < ActiveRecord::Migration[6.0]
  def change
    add_column :artworks, :favorites_count, :integer
  end
end
