class CreateConnections< ActiveRecord::Migration[5.0]
  def change
    create_table :connections do |t|
      t.float :lat
      t.float :lng
      t.string :name
      t.text :message
      t.integer :connection_type_id
      t.belongs_to :pin
      t.timestamps
    end
  end
end
