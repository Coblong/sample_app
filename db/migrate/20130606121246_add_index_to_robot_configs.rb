class AddIndexToRobotConfigs < ActiveRecord::Migration
  def change
    add_column :robot_configs, :instance_number, :integer
  end
end
