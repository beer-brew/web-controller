class CreatePins < ActiveRecord::Migration[5.0]
  def change
    create_table :pins do |t|
      t.integer :device_id
      t.integer :pin_type
      t.integer :pin_number  
      t.integer :connection_id
      t.belongs_to :device, index: true
      t.timestamps
    end
  end
end
