class CreatePrompts < ActiveRecord::Migration[6.0]
  def change
    create_table :prompts do |t|
      t.string :title
      t.text :body
      t.integer :artist_id

      t.timestamps
    end
  end
end
