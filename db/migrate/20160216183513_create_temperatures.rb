class CreateTemperatures < ActiveRecord::Migration[5.0]
  def change
    create_table :temperatures do |t|
      t.integer :sensor_id
      t.float :temperature

      t.timestamps
    end
  end
end
