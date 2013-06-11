class AddRobotConfigToMicroposts < ActiveRecord::Migration
  def change
    remove_column :microposts, :robot_id
    remove_column :microposts, :robot_name
    add_column :microposts, :robot_config_id, :integer
  end
end
