class AddCalculatedColumnsToRobotConfigs < ActiveRecord::Migration
  def change
    add_column :robot_configs, :real_profit_factor, :decimal, precision: 2, scale: 2
    add_column :robot_configs, :real_drawdown, :decimal, precision: 2, scale: 2    
  end
end
