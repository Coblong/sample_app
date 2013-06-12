class FixDataTypesForRobotConfigs < ActiveRecord::Migration
  def change
    change_column :robot_configs, :most_consecutive_wins_in_money, :decimal
  end
end
