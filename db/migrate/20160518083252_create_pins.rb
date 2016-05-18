class CreatePins < ActiveRecord::Migration[5.0]
  def change
    create_table :pins do |t|
      t.integer :device_id
      t.string :connection_id
      t.string :integer
      t.string :pin_type
      t.string :string
      
      t.belongs_to :device, index: true
      t.timestamps
    end
  end
end
