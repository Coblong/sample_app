class AddUserToRobotConfigs < ActiveRecord::Migration
  def change
    add_column :robot_configs, :user_id, :integer
    add_index :robot_configs, [:user_id, :created_at]
  end
end
