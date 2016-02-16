class CreateHeaters < ActiveRecord::Migration[5.0]
  def change
    create_table :heaters do |t|
      t.boolean :status

      t.timestamps
    end
  end
end
