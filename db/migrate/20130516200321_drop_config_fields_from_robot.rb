class DropConfigFieldsFromRobot < ActiveRecord::Migration
  change_table :robots do |t|
    t.remove :bars_in_test
    t.remove :modelling_quality
    t.remove :mismatched_chart_errors
    t.remove :initial_deposit
    t.remove :total_net_profit
    t.remove :gross_profit
    t.remove :gross_loss
    t.remove :profit_factor
    t.remove :expected_payoff
    t.remove :absolute_drawdown
    t.remove :maximal_drawdown
    t.remove :maximal_drawdown_percentage
    t.remove :relative_drawdown
    t.remove :relative_drawdown_percentage
    t.remove :total_trades
    t.remove :short_positions_won
    t.remove :long_positions_won
    t.remove :profit_trades
    t.remove :loss_trades
    t.remove :largest_profit
    t.remove :largest_loss
    t.remove :average_profit
    t.remove :average_loss
    t.remove :most_consecutive_wins
    t.remove :most_consecutive_wins_in_money
    t.remove :most_consecutive_losses
    t.remove :most_consecutive_losses_in_money
    t.remove :average_consecutive_wins
    t.remove :average_consecutive_losses
  end
end
