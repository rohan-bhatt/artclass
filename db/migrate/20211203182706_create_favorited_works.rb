class CreateFavoritedWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :favorited_works do |t|
      t.integer :artwork_id
      t.integer :favoriter_id

      t.timestamps
    end
  end
end
