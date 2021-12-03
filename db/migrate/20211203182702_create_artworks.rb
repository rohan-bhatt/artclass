class CreateArtworks < ActiveRecord::Migration[6.0]
  def change
    create_table :artworks do |t|
      t.string :image
      t.integer :artist_id
      t.string :title
      t.text :description
      t.float :dimensions_height
      t.float :dimensions_width
      t.integer :medium_id
      t.integer :mood_id
      t.integer :prompt_id

      t.timestamps
    end
  end
end
