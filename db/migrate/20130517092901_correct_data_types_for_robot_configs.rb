class CorrectDataTypesForRobotConfigs < ActiveRecord::Migration
  def change
    change_column :robot_configs, :modelling_quality, :decimal, :precision => 2, :scale => 2
    change_column :robot_configs, :initial_deposit, :decimal, :precision => 2, :scale => 2
    change_column :robot_configs, :total_net_profit, :decimal, :precision => 2, :scale => 2
    change_column :robot_configs, :gross_profit, :decimal, :precision => 2, :scale => 2
    change_column :robot_configs, :gross_loss, :decimal, :precision => 2, :scale => 2
    change_column :robot_configs, :profit_factor, :decimal, :precision => 2, :scale => 2
    change_column :robot_configs, :expected_payoff, :decimal, :precision => 2, :scale => 2
    change_column :robot_configs, :absolute_drawdown, :decimal, :precision => 2, :scale => 2
    change_column :robot_configs, :maximal_drawdown, :decimal, :precision => 2, :scale => 2
    change_column :robot_configs, :maximal_drawdown_percentage, :decimal, :precision => 2, :scale => 2
    change_column :robot_configs, :relative_drawdown, :decimal, :precision => 2, :scale => 2
    change_column :robot_configs, :relative_drawdown_percentage, :decimal, :precision => 2, :scale => 2
    change_column :robot_configs, :largest_profit, :decimal, :precision => 2, :scale => 2
    change_column :robot_configs, :largest_loss, :decimal, :precision => 2, :scale => 2
    change_column :robot_configs, :average_profit, :decimal, :precision => 2, :scale => 2
    change_column :robot_configs, :average_loss, :decimal, :precision => 2, :scale => 2    
  end
end
