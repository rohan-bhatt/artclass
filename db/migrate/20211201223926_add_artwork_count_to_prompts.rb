class AddArtworkCountToPrompts < ActiveRecord::Migration[6.0]
  def change
    add_column :prompts, :artworks_count, :integer
  end
end
