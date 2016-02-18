class CreateOngoings < ActiveRecord::Migration[5.0]
  def change
    create_table :ongoings do |t|
      t.integer :stage
      t.datetime :stage_start_time
      t.timestamps
    end
  end
end
