class AddReportDetailsToRobot < ActiveRecord::Migration
  def change
    add_column :robots, :bars_in_test, :integer
    add_column :robots, :modelling_quality, :decimal
    add_column :robots, :mismatched_chart_errors, :integer
    add_column :robots, :initial_deposit, :decimal
    add_column :robots, :total_net_profit, :decimal
    add_column :robots, :gross_profit, :decimal
    add_column :robots, :gross_loss, :decimal
    add_column :robots, :profit_factor, :decimal
    add_column :robots, :expected_payoff, :decimal
    add_column :robots, :absolute_drawdown, :decimal
    add_column :robots, :maximal_drawdown, :decimal
    add_column :robots, :maximal_drawdown_percentage, :decimal
    add_column :robots, :relative_drawdown, :decimal
    add_column :robots, :relative_drawdown_percentage, :decimal
    add_column :robots, :total_trades, :integer
    add_column :robots, :short_positions_won, :integer
    add_column :robots, :long_positions_won, :integer
    add_column :robots, :profit_trades, :integer
    add_column :robots, :loss_trades, :integer
    add_column :robots, :largest_profit, :decimal
    add_column :robots, :largest_loss, :decimal
    add_column :robots, :average_profit, :decimal
    add_column :robots, :average_loss, :decimal
    add_column :robots, :most_consecutive_wins, :integer
    add_column :robots, :most_consecutive_wins_in_money, :decimal
    add_column :robots, :most_consecutive_losses, :integer
    add_column :robots, :most_consecutive_losses_in_money, :decimal
    add_column :robots, :average_consecutive_wins, :integer
    add_column :robots, :average_consecutive_losses, :integer
  end
end
