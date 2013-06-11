require 'spec_helper'

describe RobotConfig do

  let(:robot) { FactoryGirl.create(:robot) }
  before { @robot_config = robot.robot_configs.build() }
  
  subject { @robot_config }

  it { should respond_to(:robot_id) }
  it { should respond_to(:robot) }
  its(:robot) { should == robot }

  # Set File
  it { should respond_to(:comment) }
  it { should respond_to(:magic_number) }
  it { should respond_to(:hidden_orders) }
  it { should respond_to(:account_digits) }
  it { should respond_to(:fixed_lot) }
  it { should respond_to(:risk_percentage) }
  it { should respond_to(:max_relative_drawdown) }
  it { should respond_to(:max_consecutive_losses) }
  it { should respond_to(:account_target_blance) }
  it { should respond_to(:account_stop_balance) }
  it { should respond_to(:drawdown_limiter_on) }
  it { should respond_to(:drawdown_limit_mode) }
  it { should respond_to(:drawdown_limit_period) }
  it { should respond_to(:entry_envelopes) }
  it { should respond_to(:envelope_period) }
  it { should respond_to(:ma_type) }
  it { should respond_to(:envelope_source) }
  it { should respond_to(:max_spread) }
  it { should respond_to(:reset_envelopes) }
  it { should respond_to(:fixed_range_stop_on) }
  it { should respond_to(:fixed_range_stop_ratio) }
  it { should respond_to(:dynamic_stop_envelopes) }
  it { should respond_to(:stop_loss_pips) }
  it { should respond_to(:trailing_stop) }
  it { should respond_to(:take_profit_pips) }
  it { should respond_to(:target_envelopes) }
  it { should respond_to(:max_trade_duration) }
  it { should respond_to(:ema_trend_filter) }
  it { should respond_to(:ema_trend_fast_per) }
  it { should respond_to(:ema_trend_slow_per) }
  it { should respond_to(:ema2_trend_filter) }
  it { should respond_to(:ema2_trend_tf) }
  it { should respond_to(:ema2_trend_fast_per) }
  it { should respond_to(:ema2_trend_slow_per) }
  it { should respond_to(:ema3_trend_filter) }
  it { should respond_to(:ema3_trend_tf) }
  it { should respond_to(:ema3_trend_fast_per) }
  it { should respond_to(:ema3_trend_slow_per) }
  it { should respond_to(:ema4_trend_filter) }
  it { should respond_to(:ema4_trend_tf) }
  it { should respond_to(:ema4_trend_fast_per) }
  it { should respond_to(:ema4_trend_slow_per) }
  it { should respond_to(:bbands_tf) }
  it { should respond_to(:bbands_period) }
  it { should respond_to(:bbands_deviation) }
  it { should respond_to(:bbands_applied_price) }
  it { should respond_to(:bbands_narrowing) }
  it { should respond_to(:bbands_check_max_pips) }
  it { should respond_to(:bbands_max_pips) }
  it { should respond_to(:broker_timezone) }
  it { should respond_to(:hours_00_01_GMT) }
  it { should respond_to(:hours_01_02_GMT) }
  it { should respond_to(:hours_02_03_GMT) }
  it { should respond_to(:hours_03_04_GMT) }
  it { should respond_to(:hours_04_05_GMT) }
  it { should respond_to(:hours_05_06_GMT) }
  it { should respond_to(:hours_06_07_GMT) }
  it { should respond_to(:hours_07_08_GMT) }
  it { should respond_to(:hours_08_09_GMT) }
  it { should respond_to(:hours_09_10_GMT) }
  it { should respond_to(:hours_10_11_GMT) }
  it { should respond_to(:hours_11_12_GMT) }
  it { should respond_to(:hours_12_13_GMT) }
  it { should respond_to(:hours_13_14_GMT) }
  it { should respond_to(:hours_14_15_GMT) }
  it { should respond_to(:hours_15_16_GMT) }
  it { should respond_to(:hours_16_17_GMT) }
  it { should respond_to(:hours_17_18_GMT) }
  it { should respond_to(:hours_18_19_GMT) }
  it { should respond_to(:hours_19_20_GMT) }
  it { should respond_to(:hours_20_21_GMT) }
  it { should respond_to(:hours_21_22_GMT) }
  it { should respond_to(:hours_22_23_GMT) }
  it { should respond_to(:hours_23_00_GMT) }
  it { should respond_to(:sunday_on) }
  it { should respond_to(:monday_on) }
  it { should respond_to(:tuesday_on) }
  it { should respond_to(:wednesday_on) }
  it { should respond_to(:thursday_on) }
  it { should respond_to(:friday_on) }
  it { should respond_to(:saturday_on) }
  it { should respond_to(:mon_first_entry_hour_on) }
  it { should respond_to(:mon_first_entry_hour_GMT) }
  it { should respond_to(:mon_morning_exit_hour_on) }
  it { should respond_to(:mon_morning_exit_hour_GMT) }
  it { should respond_to(:tue_morning_exit_hour_on) }
  it { should respond_to(:tue_morning_exit_hour_GMT) }
  it { should respond_to(:wed_morning_exit_hour_on) }
  it { should respond_to(:wed_morning_exit_hour_GMT) }
  it { should respond_to(:thu_morning_exit_hour_on) }
  it { should respond_to(:thu_morning_exit_hour_GMT) }
  it { should respond_to(:fri_morning_exit_hour_on) }
  it { should respond_to(:fri_morning_exit_hour_GMT) }
  it { should respond_to(:friday_exit_trades_hour_GMT) }
  it { should respond_to(:friday_last_entry_hour_GMT) }
  it { should respond_to(:acc_label_on) }
  it { should respond_to(:magic_label_on) }
  it { should respond_to(:entry_label_on) }
  it { should respond_to(:lbl_font) }
  it { should respond_to(:lbl_font_size) }
  it { should respond_to(:lbl_basic_colour) }
  it { should respond_to(:lbl_ok_colour) }
  it { should respond_to(:lbl_not_ok_colour) }
  it { should respond_to(:lbl_uptrend_colour) }
  it { should respond_to(:lbl_downtrend_colour) }
  it { should respond_to(:long_entry_colour) }
  it { should respond_to(:long_profit_colour) }
  it { should respond_to(:long_loss_colour) }
  it { should respond_to(:long_stop_colour) }
  it { should respond_to(:short_entry_colour) }
  it { should respond_to(:short_profit_colour) }
  it { should respond_to(:short_loss_colour) }
  it { should respond_to(:short_stop_colour) }
  it { should respond_to(:trailing_sl_colour) }

  # Report Details
  it { should respond_to(:average_consecutive_losses) }
  it { should respond_to(:average_consecutive_wins) }
  it { should respond_to(:most_consecutive_losses) }
  it { should respond_to(:most_consecutive_losses_in_money) }
  it { should respond_to(:most_consecutive_wins) }
  it { should respond_to(:most_consecutive_wins_in_money) }
  it { should respond_to(:average_loss) }
  it { should respond_to(:average_profit) }
  it { should respond_to(:largest_loss) }
  it { should respond_to(:largest_profit) }
  it { should respond_to(:loss_trades) }
  it { should respond_to(:profit_trades) }
  it { should respond_to(:long_positions_won) }
  it { should respond_to(:short_positions_won) }
  it { should respond_to(:total_trades) }
  it { should respond_to(:relative_drawdown) }
  it { should respond_to(:relative_drawdown_percentage) }
  it { should respond_to(:maximal_drawdown) }
  it { should respond_to(:maximal_drawdown_percentage) }
  it { should respond_to(:absolute_drawdown) }
  it { should respond_to(:expected_payoff) }
  it { should respond_to(:profit_factor) }
  it { should respond_to(:gross_loss) }
  it { should respond_to(:gross_profit) }
  it { should respond_to(:total_net_profit) }
  it { should respond_to(:initial_deposit) }
  it { should respond_to(:mismatched_chart_errors) }
  it { should respond_to(:modelling_quality) }
  it { should respond_to(:bars_in_test) }

  it { should be_valid }
end
