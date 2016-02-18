class CreateStages < ActiveRecord::Migration[5.0]
  def change
    create_table :stages do |t|
      t.string :name
      t.text :desc
      t.integer :duration
      t.float :target_temperature
      t.integer :sequence

      t.timestamps
    end
  end
end
