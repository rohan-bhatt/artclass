class AddCreatorReferenceToFavoritedWorks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :favorited_works, :artists, column: :creator_id
    add_index :favorited_works, :creator_id
    change_column_null :favorited_works, :creator_id, false
  end
end
