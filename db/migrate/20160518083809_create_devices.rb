class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.string :chip_id
      t.string :integer
      t.string :status
      t.string :integer

      t.timestamps
    end
  end
end
