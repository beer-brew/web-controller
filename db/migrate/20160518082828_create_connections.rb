class CreateConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :connections do |t|
      t.string :driver
      t.string :setup
      t.string :name
      t.string :icon
      t.integer :io_type
      t.integer :catagory
      t.timestamps
    end
  end
end
