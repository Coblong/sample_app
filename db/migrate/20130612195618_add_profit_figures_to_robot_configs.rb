class AddProfitFiguresToRobotConfigs < ActiveRecord::Migration
  def change
    add_column :robot_configs, :real_gross_profit, :decimal
    add_column :robot_configs, :real_gross_loss, :decimal
    add_column :robot_configs, :trade_count, :integer
    add_column :robot_configs, :end_balance, :decimal
  end
end
