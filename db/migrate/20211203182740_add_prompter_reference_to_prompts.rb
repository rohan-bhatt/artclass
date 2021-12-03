class AddPrompterReferenceToPrompts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :prompts, :artists
    add_index :prompts, :artist_id
    change_column_null :prompts, :artist_id, false
  end
end
