class AddShouldStopToStages < ActiveRecord::Migration[5.0]
  def change
    add_column :stages, :should_stop, :boolean, default: false
  end
end
