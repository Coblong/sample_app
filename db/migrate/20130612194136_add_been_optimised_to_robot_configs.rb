class AddBeenOptimisedToRobotConfigs < ActiveRecord::Migration
  def change
    add_column :robot_configs, :been_optimised, :boolean
  end
end
