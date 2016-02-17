class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :type
      t.text :desc
      t.integer :device_id
      t.boolean :online_status

      t.timestamps
    end
  end
end
