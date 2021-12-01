class CreateMediumTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :medium_types do |t|
      t.string :medium

      t.timestamps
    end
  end
end
