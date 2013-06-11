class DropSetFileFromRobots < ActiveRecord::Migration
  def change
    change_table :robots do |t|
      t.remove :comment
      t.remove :magic_number 
      t.remove :account_digits
      t.remove :fixed_lot
      t.remove :risk_percentage
      t.remove :max_relative_drawdown
      t.remove :max_consecutive_losses
      t.remove :account_target_blance
      t.remove :account_stop_balance
      t.remove :drawdown_limiter_on
      t.remove :drawdown_limit_mode
      t.remove :drawdown_limit_period
      t.remove :entry_envelopes
      t.remove :envelope_period
      t.remove :ma_type
      t.remove :envelope_source
      t.remove :max_spread
      t.remove :reset_envelopes
      t.remove :fixed_range_stop_on
      t.remove :fixed_range_stop_ratio
      t.remove :dynamic_stop_envelopes
      t.remove :stop_loss_pips
      t.remove :trailing_stop
      t.remove :take_profit_pips
      t.remove :target_envelopes
      t.remove :max_trade_duration
      t.remove :ema_trend_filter
      t.remove :ema_trend_fast_per
      t.remove :ema_trend_slow_per
      t.remove :ema2_trend_filter
      t.remove :ema2_trend_tf
      t.remove :ema2_trend_fast_per
      t.remove :ema2_trend_slow_per
      t.remove :ema3_trend_filter
      t.remove :ema3_trend_tf
      t.remove :ema3_trend_fast_per
      t.remove :ema3_trend_slow_per
      t.remove :ema4_trend_filter
      t.remove :ema4_trend_tf
      t.remove :ema4_trend_fast_per
      t.remove :ema4_trend_slow_per
      t.remove :bbands_tf
      t.remove :bbands_period
      t.remove :bbands_deviation
      t.remove :bbands_applied_price
      t.remove :bbands_narrowing
      t.remove :bbands_check_max_pips
      t.remove :bbands_max_pips
      t.remove :broker_timezone
      t.remove :hours_00_01_GMT
      t.remove :hours_01_02_GMT
      t.remove :hours_02_03_GMT
      t.remove :hours_03_04_GMT
      t.remove :hours_04_05_GMT
      t.remove :hours_05_06_GMT
      t.remove :hours_06_07_GMT
      t.remove :hours_07_08_GMT
      t.remove :hours_08_09_GMT
      t.remove :hours_09_10_GMT
      t.remove :hours_10_11_GMT
      t.remove :hours_11_12_GMT
      t.remove :hours_12_13_GMT
      t.remove :hours_13_14_GMT
      t.remove :hours_14_15_GMT
      t.remove :hours_15_16_GMT
      t.remove :hours_16_17_GMT
      t.remove :hours_17_18_GMT
      t.remove :hours_18_19_GMT
      t.remove :hours_19_20_GMT
      t.remove :hours_20_21_GMT
      t.remove :hours_21_22_GMT
      t.remove :hours_22_23_GMT
      t.remove :hours_23_00_GMT
      t.remove :sunday_on
      t.remove :monday_on
      t.remove :tuesday_on
      t.remove :wednesday_on
      t.remove :thursday_on
      t.remove :friday_on
      t.remove :saturday_on
      t.remove :mon_first_entry_hour_on
      t.remove :mon_first_entry_hour_GMT
      t.remove :mon_morning_exit_hour_on
      t.remove :mon_morning_exit_hour_GMT
      t.remove :tue_morning_exit_hour_on
      t.remove :tue_morning_exit_hour_GMT
      t.remove :wed_morning_exit_hour_on
      t.remove :wed_morning_exit_hour_GMT
      t.remove :thu_morning_exit_hour_on
      t.remove :thu_morning_exit_hour_GMT 
      t.remove :fri_morning_exit_hour_on
      t.remove :fri_morning_exit_hour_GMT
      t.remove :friday_exit_trades_hour_GMT
      t.remove :friday_last_entry_hour_GMT
      t.remove :acc_label_on
      t.remove :magic_label_on
      t.remove :entry_label_on
      t.remove :lbl_font
      t.remove :lbl_font_size
      t.remove :lbl_basic_colour; 
      t.remove :lbl_ok_colour
      t.remove :lbl_not_ok_colour
      t.remove :lbl_uptrend_colour
      t.remove :lbl_downtrend_colour 
      t.remove :long_entry_colour 
      t.remove :long_profit_colour
      t.remove :long_loss_colour 
      t.remove :long_stop_colour
      t.remove :short_entry_colour
      t.remove :short_profit_colour
      t.remove :short_loss_colour 
      t.remove :short_stop_colour
      t.remove :trailing_sl_colour
    end
  end
end
