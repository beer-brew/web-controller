class CreateConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :connections do |t|
      t.string :driver
      t.string :setup
      t.integer :io_type

      t.timestamps
    end
  end
end
