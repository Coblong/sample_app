class CreateRobotConfigs < ActiveRecord::Migration
  def up
    drop_table :robot_configs
  end

  def down    
    create_table :robot_configs do |t|
      t.integer :robot_id
      t.integer :bars_in_test
      t.decimal :modelling_quality
      t.integer :mismatched_chart_errors
      t.decimal :initial_deposit
      t.decimal :total_net_profit
      t.decimal :gross_profit
      t.decimal :gross_loss
      t.decimal :profit_factor
      t.decimal :expected_payoff
      t.decimal :absolute_drawdown
      t.decimal :maximal_drawdown
      t.decimal :maximal_drawdown_percentage
      t.decimal :relative_drawdown
      t.decimal :relative_drawdown_percentage
      t.integer :total_trades
      t.integer :short_positions_won
      t.integer :long_positions_won
      t.integer :profit_trades
      t.integer :loss_trades
      t.decimal :largest_profit
      t.decimal :largest_loss
      t.decimal :average_profit
      t.decimal :average_loss
      t.integer :most_consecutive_wins
      t.decimal :most_consecutive_wins_in_money
      t.integer :most_consecutive_losses
      t.decimal :most_consecutive_losses_in_money
      t.integer :average_consecutive_wins
      t.integer :average_consecutive_losses

      t.timestamps
    end
    add_index :robot_configs, [:robot_id, :created_at]
  end
end
