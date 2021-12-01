class AddPromptReferenceToArtworks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :artworks, :prompts
    add_index :artworks, :prompt_id
  end
end
