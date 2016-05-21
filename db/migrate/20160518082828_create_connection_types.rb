class CreateConnectionTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :connection_types do |t|
      t.string :name
      t.string :icon
      t.string :class_name
      t.integer :io_type
      t.integer :catagory
      t.timestamps
    end
  end
end
