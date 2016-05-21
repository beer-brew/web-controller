class CreateConnectionData< ActiveRecord::Migration[5.0]
  def change
    create_table :connection_data do |t|
      t.float :value
      t.datetime :time
      t.string :name
      t.float :lng
      t.float :lat
      t.belongs_to :connection
      t.integer :data_id
      t.timestamps
    end
  end
end
 
