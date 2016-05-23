class CreateStages < ActiveRecord::Migration[5.0]
  def change
    create_table :stages do |t|
      t.string :name, default: 'stage name'
      t.integer :input_device
      t.string :input_logic
      t.integer :output_device
      t.integer :stop_device
      t.string :stop_logic
      t.integer :sequence, default: 0
      t.boolean :should_stop, default: false 

      t.timestamps
    end
  end
end
