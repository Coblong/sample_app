class DropBeenOptimisedFromRobotConfigs < ActiveRecord::Migration
  def change
    remove_column :robot_configs, :been_optimised
  end
end
