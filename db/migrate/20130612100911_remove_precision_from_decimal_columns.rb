class RemovePrecisionFromDecimalColumns < ActiveRecord::Migration
  def change
    change_column :robot_configs, :modelling_quality, :decimal
    change_column :robot_configs, :mismatched_chart_errors, :decimal
    change_column :robot_configs, :initial_deposit, :decimal
    change_column :robot_configs, :total_net_profit, :decimal
    change_column :robot_configs, :gross_profit, :decimal
    change_column :robot_configs, :gross_loss, :decimal
    change_column :robot_configs, :profit_factor, :decimal
    change_column :robot_configs, :expected_payoff, :decimal
    change_column :robot_configs, :absolute_drawdown, :decimal
    change_column :robot_configs, :maximal_drawdown, :decimal
    change_column :robot_configs, :maximal_drawdown_percentage, :decimal
    change_column :robot_configs, :relative_drawdown, :decimal
    change_column :robot_configs, :relative_drawdown_percentage, :decimal
    change_column :robot_configs, :largest_profit, :decimal
    change_column :robot_configs, :largest_loss, :decimal
    change_column :robot_configs, :average_profit, :decimal
    change_column :robot_configs, :average_loss, :decimal
    change_column :robot_configs, :most_consecutive_wins_in_money, :decimal
    change_column :robot_configs, :most_consecutive_losses_in_money, :decimal
    change_column :robot_configs, :risk_percentage, :decimal
    change_column :robot_configs, :entry_envelopes, :decimal
    change_column :robot_configs, :max_spread, :decimal
    change_column :robot_configs, :reset_envelopes, :decimal
    change_column :robot_configs, :fixed_range_stop_ratio, :decimal
    change_column :robot_configs, :target_envelopes, :decimal
    change_column :robot_configs, :real_profit_factor, :decimal
    change_column :robot_configs, :real_drawdown, :decimal
  end
end
