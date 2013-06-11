class FixDataTypesForRobotConfigs < ActiveRecord::Migration
  def change
    change_column :robot_configs, :most_consecutive_wins_in_money, :decimal, :precision => 2, :scale => 2    
  end
end
