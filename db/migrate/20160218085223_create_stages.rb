class CreateStages < ActiveRecord::Migration[5.0]
  def change
    create_table :stages do |t|
      t.string :name, default: 'stage name'
      t.text :desc
      t.integer :duration, default: 'duration'
      t.float :target_temperature, default: 0.0
      t.integer :sequence, default: 0

      t.timestamps
    end
  end
end
