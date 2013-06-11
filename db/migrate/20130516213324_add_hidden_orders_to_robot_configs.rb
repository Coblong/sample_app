class AddHiddenOrdersToRobotConfigs < ActiveRecord::Migration
  def change
    add_column :robot_configs, :hidden_orders, :boolean
  end
end
