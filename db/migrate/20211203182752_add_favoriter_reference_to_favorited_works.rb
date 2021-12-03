class AddFavoriterReferenceToFavoritedWorks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :favorited_works, :artists, column: :favoriter_id
    add_index :favorited_works, :favoriter_id
    change_column_null :favorited_works, :favoriter_id, false
  end
end
