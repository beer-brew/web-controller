class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.integer :chip_id, null: false, unique: true
      t.integer :status, default: 0
      t.string :ip
      t.string :mac_address
      t.string :ssid
      t.timestamps
    end
  end
end
