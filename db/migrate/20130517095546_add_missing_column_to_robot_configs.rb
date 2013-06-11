class AddMissingColumnToRobotConfigs < ActiveRecord::Migration
  def change
    add_column :robot_configs, :most_consecutive_losses_in_money, :decimal, :precision => 2, :scale => 2
  end
end
