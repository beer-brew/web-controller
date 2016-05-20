class CreateInputData < ActiveRecord::Migration[5.0]
  def change
    create_table :temperatures do |t|
      t.float :input_data
      t.integer :connection_id 
      t.timestamps
    end
  end
end
