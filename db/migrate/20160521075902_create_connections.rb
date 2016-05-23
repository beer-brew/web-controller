class CreateConnections< ActiveRecord::Migration[5.0]
  def change
    create_table :connections do |t|
      t.float :lat
      t.float :lng
      t.string :name
      t.string :type
      t.text :message
      t.belongs_to :connection_type
      t.belongs_to :pin
      t.timestamps
    end
  end
end
