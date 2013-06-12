class AddCalculatedColumnsToRobotConfigs < ActiveRecord::Migration
  def change
    add_column :robot_configs, :real_profit_factor, :decimal
    add_column :robot_configs, :real_drawdown, :decimal
  end
end
