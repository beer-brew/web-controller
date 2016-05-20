class CreateStages < ActiveRecord::Migration[5.0]
  def change
    create_table :stages do |t|
      t.string :name, default: 'stage name'
      t.integer :input_device
      t.string :output_logic
      t.integer :output_device
      t.integer :stop_device
      t.string :stop_logic
      t.integer :sequence, default: 0

      t.timestamps
    end
  end
end
