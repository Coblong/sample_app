class AddSetFileToRobotConfigs < ActiveRecord::Migration
  def change
    add_column :robot_configs, :comment, :string
    add_column :robot_configs, :magic_number, :integer 
    add_column :robot_configs, :hidden_orders, :boolean
    add_column :robot_configs, :account_digits, :integer
    add_column :robot_configs, :fixed_lot, :integer
    add_column :robot_configs, :risk_percentage, :decimal
    add_column :robot_configs, :max_relative_drawdown, :integer
    add_column :robot_configs, :max_consecutive_losses, :integer
    add_column :robot_configs, :account_target_blance, :integer
    add_column :robot_configs, :account_stop_balance, :integer
    add_column :robot_configs, :drawdown_limiter_on, :boolean
    add_column :robot_configs, :drawdown_limit_mode, :string
    add_column :robot_configs, :drawdown_limit_period, :integer
    add_column :robot_configs, :entry_envelopes, :decimal, precision: 8, scale: 3
    add_column :robot_configs, :envelope_period, :integer
    add_column :robot_configs, :ma_type, :integer
    add_column :robot_configs, :envelope_source, :integer
    add_column :robot_configs, :max_spread, :decimal, precision: 2, scale: 2
    add_column :robot_configs, :reset_envelopes, :decimal, precision: 8, scale: 3
    add_column :robot_configs, :fixed_range_stop_on, :boolean
    add_column :robot_configs, :fixed_range_stop_ratio, :decimal, precision:8, scale: 3
    add_column :robot_configs, :dynamic_stop_envelopes, :integer
    add_column :robot_configs, :stop_loss_pips, :integer
    add_column :robot_configs, :trailing_stop, :integer
    add_column :robot_configs, :take_profit_pips, :integer
    add_column :robot_configs, :target_envelopes, :decimal, precision: 8, scale: 3
    add_column :robot_configs, :max_trade_duration, :integer
    add_column :robot_configs, :ema_trend_filter, :boolean
    add_column :robot_configs, :ema_trend_fast_per, :integer
    add_column :robot_configs, :ema_trend_slow_per, :integer
    add_column :robot_configs, :ema2_trend_filter, :boolean
    add_column :robot_configs, :ema2_trend_tf, :integer
    add_column :robot_configs, :ema2_trend_fast_per, :integer
    add_column :robot_configs, :ema2_trend_slow_per, :integer
    add_column :robot_configs, :ema3_trend_filter, :boolean
    add_column :robot_configs, :ema3_trend_tf, :integer
    add_column :robot_configs, :ema3_trend_fast_per, :integer
    add_column :robot_configs, :ema3_trend_slow_per, :integer
    add_column :robot_configs, :ema4_trend_filter, :boolean
    add_column :robot_configs, :ema4_trend_tf, :integer
    add_column :robot_configs, :ema4_trend_fast_per, :integer
    add_column :robot_configs, :ema4_trend_slow_per, :integer
    add_column :robot_configs, :bbands_tf, :integer
    add_column :robot_configs, :bbands_period, :integer
    add_column :robot_configs, :bbands_deviation, :integer
    add_column :robot_configs, :bbands_applied_price, :integer
    add_column :robot_configs, :bbands_narrowing, :boolean
    add_column :robot_configs, :bbands_check_max_pips, :boolean
    add_column :robot_configs, :bbands_max_pips, :integer
    add_column :robot_configs, :broker_timezone, :integer
    add_column :robot_configs, :hours_00_01_GMT, :boolean
    add_column :robot_configs, :hours_01_02_GMT, :boolean
    add_column :robot_configs, :hours_02_03_GMT, :boolean
    add_column :robot_configs, :hours_03_04_GMT, :boolean
    add_column :robot_configs, :hours_04_05_GMT, :boolean
    add_column :robot_configs, :hours_05_06_GMT, :boolean
    add_column :robot_configs, :hours_06_07_GMT, :boolean
    add_column :robot_configs, :hours_07_08_GMT, :boolean
    add_column :robot_configs, :hours_08_09_GMT, :boolean
    add_column :robot_configs, :hours_09_10_GMT, :boolean
    add_column :robot_configs, :hours_10_11_GMT, :boolean
    add_column :robot_configs, :hours_11_12_GMT, :boolean
    add_column :robot_configs, :hours_12_13_GMT, :boolean
    add_column :robot_configs, :hours_13_14_GMT, :boolean
    add_column :robot_configs, :hours_14_15_GMT, :boolean
    add_column :robot_configs, :hours_15_16_GMT, :boolean
    add_column :robot_configs, :hours_16_17_GMT, :boolean
    add_column :robot_configs, :hours_17_18_GMT, :boolean
    add_column :robot_configs, :hours_18_19_GMT, :boolean
    add_column :robot_configs, :hours_19_20_GMT, :boolean
    add_column :robot_configs, :hours_20_21_GMT, :boolean
    add_column :robot_configs, :hours_21_22_GMT, :boolean
    add_column :robot_configs, :hours_22_23_GMT, :boolean
    add_column :robot_configs, :hours_23_00_GMT, :boolean
    add_column :robot_configs, :sunday_on, :boolean
    add_column :robot_configs, :monday_on, :boolean
    add_column :robot_configs, :tuesday_on, :boolean
    add_column :robot_configs, :wednesday_on, :boolean
    add_column :robot_configs, :thursday_on, :boolean
    add_column :robot_configs, :friday_on, :boolean
    add_column :robot_configs, :saturday_on, :boolean
    add_column :robot_configs, :mon_first_entry_hour_on, :boolean
    add_column :robot_configs, :mon_first_entry_hour_GMT, :integer
    add_column :robot_configs, :mon_morning_exit_hour_on, :boolean
    add_column :robot_configs, :mon_morning_exit_hour_GMT, :integer
    add_column :robot_configs, :tue_morning_exit_hour_on, :boolean
    add_column :robot_configs, :tue_morning_exit_hour_GMT, :integer
    add_column :robot_configs, :wed_morning_exit_hour_on, :boolean
    add_column :robot_configs, :wed_morning_exit_hour_GMT, :integer
    add_column :robot_configs, :thu_morning_exit_hour_on, :boolean
    add_column :robot_configs, :thu_morning_exit_hour_GMT, :integer 
    add_column :robot_configs, :fri_morning_exit_hour_on, :boolean
    add_column :robot_configs, :fri_morning_exit_hour_GMT, :integer
    add_column :robot_configs, :friday_exit_trades_hour_GMT, :integer
    add_column :robot_configs, :friday_last_entry_hour_GMT, :integer
    add_column :robot_configs, :acc_label_on, :boolean
    add_column :robot_configs, :magic_label_on, :boolean
    add_column :robot_configs, :entry_label_on, :boolean
    add_column :robot_configs, :lbl_font, :string
    add_column :robot_configs, :lbl_font_size, :integer
    add_column :robot_configs, :lbl_basic_colour, :string; 
    add_column :robot_configs, :lbl_ok_colour, :string
    add_column :robot_configs, :lbl_not_ok_colour, :string
    add_column :robot_configs, :lbl_uptrend_colour, :string
    add_column :robot_configs, :lbl_downtrend_colour, :string 
    add_column :robot_configs, :long_entry_colour, :string 
    add_column :robot_configs, :long_profit_colour, :string
    add_column :robot_configs, :long_loss_colour, :string 
    add_column :robot_configs, :long_stop_colour, :string
    add_column :robot_configs, :short_entry_colour, :string
    add_column :robot_configs, :short_profit_colour, :string
    add_column :robot_configs, :short_loss_colour, :string 
    add_column :robot_configs, :short_stop_colour, :string
    add_column :robot_configs, :trailing_sl_colour, :string
  end
end