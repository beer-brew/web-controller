class CreateConnectionData< ActiveRecord::Migration[5.0]
  def change
    create_table :connection_data do |t|
      t.float :value
      t.datetime :time
      t.string :name
      t.belongs_to :connection
      t.timestamps
    end
  end
end
