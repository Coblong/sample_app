class RobotConfig < ActiveRecord::Base
  belongs_to :robot
  belongs_to :user
  has_many :microposts, dependent: :destroy, :autosave => true
  attr_accessor :is_dirty
  validates :robot_id, presence: true  
  validates :user_id, presence: true  
  
  default_scope order: 'real_profit_factor DESC'

  def tokyo_selected
    hours_00_01_GMT and hours_01_02_GMT and hours_02_03_GMT and hours_03_04_GMT and hours_04_05_GMT and hours_05_06_GMT and hours_06_07_GMT and hours_23_00_GMT
  end

  def london_selected
    hours_07_08_GMT and hours_08_09_GMT and hours_09_10_GMT and hours_10_11_GMT and hours_11_12_GMT and hours_12_13_GMT and hours_13_14_GMT and hours_14_15_GMT and hours_15_16_GMT
  end

  def newyork_selected
    hours_12_13_GMT and hours_13_14_GMT and hours_14_15_GMT and hours_15_16_GMT and hours_16_17_GMT and hours_17_18_GMT and hours_18_19_GMT and hours_19_20_GMT 
  end

  def updated_date
    updated_at.strftime("%d.%m.%y %H:%M")
  end

  def created_date
    created_at.strftime("%d.%m.%y %H:%M")
  end

  def created_date_short
    created_at.strftime("%d.%m.%y")
  end

  def display_profit_factor
    if instance_number == 1
      profit_factor.to_s + '% (' + real_profit_factor.to_s + '%)'
    else
      real_profit_factor.to_s
    end
  end

  def display_drawdown
    if instance_number == 1
      relative_drawdown.to_s + '% (' + real_drawdown.to_s + '%)'
    else
      real_drawdown.to_s
    end
  end

  def display_gross_profit
    number_to_currency(real_gross_profit, unit: "&pound;")
  end

  def net_profit
    real_gross_profit - real_gross_loss
  end

  def display_net_profit
    number_to_currency(net_profit, unit: "&pound;")
  end

  def as_set_file

    output = '_EA_=" --- Thanks for using EA Control --- "
_inp1_= --- GENERAL SETTINGS --- 
MyComment=EAC - ' + self.robot.name + ' - ' + Time.now.strftime("%d.%m.%y %H:%M") + '
Magic=0
Magic,F=0
Magic,1=0
Magic,2=0
Magic,3=0
HiddenOrders=0
AccDigits=' + self.account_digits.to_s + '
AccDigits,F=5
AccDigits,1=5
AccDigits,2=5
AccDigits,3=5
_inp2_= --- RISK MANAGEMENT CRITERIA ---
FixedLot=' + self.fixed_lot.to_s + '
FixedLot,F=0
FixedLot,1=0
FixedLot,2=0
FixedLot,3=0
RiskPcnt=' + self.risk_percentage.to_s + '
RiskPcnt,F=0
RiskPcnt,1=1
RiskPcnt,2=0.5
RiskPcnt,3=3
Max.Rel.Drawdown=' + self.max_relative_drawdown.to_s + '
Max.Rel.Drawdown,F=0
Max.Rel.Drawdown,1=5
Max.Rel.Drawdown,2=1
Max.Rel.Drawdown,3=10
MaxConsecutiveLosses=' + self.max_consecutive_losses.to_s + '
MaxConsecutiveLosses,F=0
MaxConsecutiveLosses,1=0
MaxConsecutiveLosses,2=0
MaxConsecutiveLosses,3=0
Acc.Target.Bal=' + self.account_target_blance.to_s + '
Acc.Target.Bal,F=0
Acc.Target.Bal,1=0
Acc.Target.Bal,2=0
Acc.Target.Bal,3=0
Acc.Stop.Bal=' + self.account_stop_balance.to_s + '
Acc.Stop.Bal,F=0
Acc.Stop.Bal,1=0
Acc.Stop.Bal,2=0
Acc.Stop.Bal,3=0
_inp2.5_= --- DRAWDOWWN LIMITER --- 
Drawdown.Limiter.On=' + (self.drawdown_limiter_on ? 1 : 0).to_s + '
Drd.Lim.Mode=' + self.drawdown_limit_mode.to_s + '
Drd.Lim.Period=' + self.drawdown_limit_period.to_s + '
Drd.Lim.Period,F=0
Drd.Lim.Period,1=0
Drd.Lim.Period,2=0
Drd.Lim.Period,3=0
_inp3_= --- ENTRY CRITERIA ---
Entry_Envelopes=' + self.entry_envelopes.to_s + '
Entry_Envelopes,F=0
Entry_Envelopes,1=' + (self.entry_envelopes - 0.05).to_s + '
Entry_Envelopes,2=0.01
Entry_Envelopes,3=' + (self.entry_envelopes + 0.05).to_s + '
Envelope_Period=' + self.envelope_period.to_s + '
Envelope_Period,F=0
Envelope_Period,1=' + (self.envelope_period - 3).to_s + '
Envelope_Period,2=1
Envelope_Period,3=' + (self.envelope_period + 3).to_s + '
MA_Type=' + self.ma_type.to_s + '
MA_Type,F=0
MA_Type,1=0
MA_Type,2=1
MA_Type,3=3
Envelope_Source=' + self.envelope_source.to_s + '
Envelope_Source,F=0
Envelope_Source,1=0
Envelope_Source,2=1
Envelope_Source,3=4
Max_Spread=' + self.max_spread.to_s + '
Max_Spread,F=0
Max_Spread,1=0
Max_Spread,2=0
Max_Spread,3=0
Reset_Envelopes=' + self.reset_envelopes.to_s + '
Reset_Envelopes,F=0
Reset_Envelopes,1=' + (self.reset_envelopes - 0.03).to_s + '
Reset_Envelopes,2=0.01
Reset_Envelopes,3=' + (self.reset_envelopes + 0.03).to_s + '
_inp4_= --- STOP LOSS CRITERIA ---
Fixed_Range_Stop_On=' + (self.fixed_range_stop_on ? 1 : 0).to_s + '
Fixed_Range_Stop_Ratio=' + self.fixed_range_stop_ratio.to_s + '
Fixed_Range_Stop_Ratio,F=0
Fixed_Range_Stop_Ratio,1=' + (self.fixed_range_stop_ratio - 0.3).to_s + '
Fixed_Range_Stop_Ratio,2=0.1
Fixed_Range_Stop_Ratio,3=' + (self.fixed_range_stop_ratio + 0.3).to_s + '
Dynamic_Stop_Envelopes=' + self.dynamic_stop_envelopes.to_s + '
Dynamic_Stop_Envelopes,F=0
Dynamic_Stop_Envelopes,1=' + (self.dynamic_stop_envelopes - 0.03).to_s + '
Dynamic_Stop_Envelopes,2=0.01
Dynamic_Stop_Envelopes,3=' + (self.dynamic_stop_envelopes + 0.03).to_s + '
Stop_Loss_Pips=' + self.stop_loss_pips.to_s + '
Stop_Loss_Pips,F=0
Stop_Loss_Pips,1=' + (self.stop_loss_pips - 5).to_s + '
Stop_Loss_Pips,2=2
Stop_Loss_Pips,3=' + (self.stop_loss_pips + 5).to_s + '
Trailing_Stop=' + self.trailing_stop.to_s + '
Trailing_Stop,F=0
Trailing_Stop,1=' + (self.trailing_stop - 3).to_s + '
Trailing_Stop,2=1
Trailing_Stop,3=' + (self.trailing_stop + 3).to_s + '
_inp5_= --- TARGET CRITERIA ---
Take_Profit_Pips=' + self.take_profit_pips.to_s + '
Take_Profit_Pips,F=0
Take_Profit_Pips,1=' + (self.take_profit_pips - 5).to_s + '
Take_Profit_Pips,2=2
Take_Profit_Pips,3=' + (self.take_profit_pips + 5).to_s + '
Target_Envelopes=' + self.target_envelopes.to_s + '
Target_Envelopes,F=0
Target_Envelopes,1=' + (self.target_envelopes - 0.05).to_s + '
Target_Envelopes,2=0.01
Target_Envelopes,3=' + (self.target_envelopes + 0.05).to_s + '
Max_Trade_Duration=' + self.max_trade_duration.to_s + '
Max_Trade_Duration,F=0
Max_Trade_Duration,1=0
Max_Trade_Duration,2=0
Max_Trade_Duration,3=0
_inp6_= --- TREND FILTERS ---
EMA_Trend_Filter=' + (self.ema_trend_filter ? 1 : 0).to_s + '
EMA_Trend_Fast_Per=' + self.ema_trend_fast_per.to_s + '
EMA_Trend_Fast_Per,F=0
EMA_Trend_Fast_Per,1=' + (self.ema_trend_fast_per - 3).to_s + '
EMA_Trend_Fast_Per,2=1
EMA_Trend_Fast_Per,3=' + (self.ema_trend_fast_per + 3).to_s + '
EMA_Trend_Slow_Per=' + self.ema_trend_slow_per.to_s + '
EMA_Trend_Slow_Per,F=0
EMA_Trend_Slow_Per,1=' + (self.ema_trend_slow_per - 3).to_s + '
EMA_Trend_Slow_Per,2=1
EMA_Trend_Slow_Per,3=' + (self.ema_trend_slow_per + 3).to_s + '
EMA2_Trend_Filter=' + (self.ema2_trend_filter ? 1 : 0).to_s + '
EMA2_Trend_TF=' + self.ema2_trend_tf.to_s + '
EMA2_Trend_TF,F=0
EMA2_Trend_TF,1=' + self.ema2_trend_tf.to_s + '
EMA2_Trend_TF,2=' + self.ema2_trend_tf.to_s + '
EMA2_Trend_TF,3=' + self.ema2_trend_tf.to_s + '
EMA2_Trend_Fast_Per=' + self.ema2_trend_fast_per.to_s + '
EMA2_Trend_Fast_Per,F=0
EMA2_Trend_Fast_Per,1=' + self.ema2_trend_fast_per.to_s + '
EMA2_Trend_Fast_Per,2=' + self.ema2_trend_fast_per.to_s + '
EMA2_Trend_Fast_Per,3=' + self.ema2_trend_fast_per.to_s + '
EMA2_Trend_Slow_Per=' + self.ema2_trend_slow_per.to_s + '
EMA2_Trend_Slow_Per,F=0
EMA2_Trend_Slow_Per,1=' + self.ema2_trend_slow_per.to_s + '
EMA2_Trend_Slow_Per,2=' + self.ema2_trend_slow_per.to_s + '
EMA2_Trend_Slow_Per,3=' + self.ema2_trend_slow_per.to_s + '
EMA3_Trend_Filter=' + (self.ema3_trend_filter ? 1 : 0).to_s + '
EMA3_Trend_TF=' + self.ema3_trend_tf.to_s + '
EMA3_Trend_TF,F=0
EMA3_Trend_TF,1=' + self.ema3_trend_tf.to_s + '
EMA3_Trend_TF,2=' + self.ema3_trend_tf.to_s + '
EMA3_Trend_TF,3=' + self.ema3_trend_tf.to_s + '
EMA3_Trend_Fast_Per=' + self.ema3_trend_fast_per.to_s + '
EMA3_Trend_Fast_Per,F=0
EMA3_Trend_Fast_Per,1=' + self.ema3_trend_fast_per.to_s + '
EMA3_Trend_Fast_Per,2=' + self.ema3_trend_fast_per.to_s + '
EMA3_Trend_Fast_Per,3=' + self.ema3_trend_fast_per.to_s + '
EMA3_Trend_Slow_Per=' + self.ema3_trend_slow_per.to_s + '
EMA3_Trend_Slow_Per,F=0
EMA3_Trend_Slow_Per,1=' + self.ema3_trend_slow_per.to_s + '
EMA3_Trend_Slow_Per,2=' + self.ema3_trend_slow_per.to_s + '
EMA3_Trend_Slow_Per,3=' + self.ema3_trend_slow_per.to_s + '
EMA4_Trend_Filter=' + (self.ema4_trend_filter ? 1 : 0).to_s + '
EMA4_Trend_TF=' + self.ema4_trend_tf.to_s + '
EMA4_Trend_TF,F=0
EMA4_Trend_TF,1=' + self.ema4_trend_tf.to_s + '
EMA4_Trend_TF,2=' + self.ema4_trend_tf.to_s + '
EMA4_Trend_TF,3=' + self.ema4_trend_tf.to_s + '
EMA4_Trend_Fast_Per=' + self.ema4_trend_fast_per.to_s + '
EMA4_Trend_Fast_Per,F=0
EMA4_Trend_Fast_Per,1=' + self.ema4_trend_fast_per.to_s + '
EMA4_Trend_Fast_Per,2=' + self.ema4_trend_fast_per.to_s + '
EMA4_Trend_Fast_Per,3=' + self.ema4_trend_fast_per.to_s + '
EMA4_Trend_Slow_Per=' + self.ema4_trend_slow_per.to_s + '
EMA4_Trend_Slow_Per,F=0
EMA4_Trend_Slow_Per,1=' + self.ema4_trend_slow_per.to_s + '
EMA4_Trend_Slow_Per,2=' + self.ema4_trend_slow_per.to_s + '
EMA4_Trend_Slow_Per,3=' + self.ema4_trend_slow_per.to_s + '
_inp7_= --- CONSOLIDATION FILTER ---
BBands.TF=' + self.bbands_tf.to_s + '
BBands.TF,F=0
BBands.TF,1=' + self.bbands_tf.to_s + '
BBands.TF,2=' + self.bbands_tf.to_s + '
BBands.TF,3=' + self.bbands_tf.to_s + '
BBands.Period=' + self.bbands_period.to_s + '
BBands.Period,F=0
BBands.Period,1=' + (self.bbands_period - 3).to_s + '
BBands.Period,2=1
BBands.Period,3=' + (self.bbands_period + 3).to_s + '
BBands.Deviation=' + self.bbands_deviation.to_s + '
BBands.Deviation,F=0
BBands.Deviation,1=' + self.bbands_deviation.to_s + '
BBands.Deviation,2=' + self.bbands_deviation.to_s + '
BBands.Deviation,3=' + self.bbands_deviation.to_s + '
BBands.AppliedPrice=' + self.bbands_applied_price.to_s + '
BBands.AppliedPrice,F=0
BBands.AppliedPrice,1=0
BBands.AppliedPrice,2=0
BBands.AppliedPrice,3=0
BBands.Narrowing=' + (self.bbands_narrowing ? 1 : 0).to_s + '
BBands.CheckMaxPips=' + (self.bbands_check_max_pips ? 1 : 0).to_s + '
BBands.MaxPips=' + self.bbands_max_pips.to_s + '
BBands.MaxPips,F=0
BBands.MaxPips,1=' + (self.bbands_max_pips - 5).to_s + '
BBands.MaxPips,2=2
BBands.MaxPips,3=' + (self.bbands_max_pips + 5).to_s + '
_inp8_= --- TIME MANAGEMENT CRITERIA ---
Broker.TimeZone=' + self.broker_timezone.to_s + '
Broker.TimeZone,F=0
Broker.TimeZone,1=' + self.broker_timezone.to_s + '
Broker.TimeZone,2=' + self.broker_timezone.to_s + '
Broker.TimeZone,3=' + self.broker_timezone.to_s + '
Hours_00_01_GMT=' + (self.hours_00_01_GMT ? 1 : 0).to_s + '
Hours_00_01_GMT,F=0
Hours_00_01_GMT,1=0
Hours_00_01_GMT,2=1
Hours_00_01_GMT,3=1
Hours_01_02_GMT=' + (self.hours_01_02_GMT ? 1 : 0).to_s + '
Hours_01_02_GMT,F=0
Hours_01_02_GMT,1=0
Hours_01_02_GMT,2=1
Hours_01_02_GMT,3=1
Hours_02_03_GMT=' + (self.hours_02_03_GMT ? 1 : 0).to_s + '
Hours_02_03_GMT,F=0
Hours_02_03_GMT,1=0
Hours_02_03_GMT,2=1
Hours_02_03_GMT,3=1
Hours_03_04_GMT=' + (self.hours_03_04_GMT ? 1 : 0).to_s + '
Hours_03_04_GMT,F=0
Hours_03_04_GMT,1=0
Hours_03_04_GMT,2=1
Hours_03_04_GMT,3=1
Hours_04_05_GMT=' + (self.hours_04_05_GMT ? 1 : 0).to_s + '
Hours_04_05_GMT,F=0
Hours_04_05_GMT,1=0
Hours_04_05_GMT,2=1
Hours_04_05_GMT,3=1
Hours_05_06_GMT=' + (self.hours_05_06_GMT ? 1 : 0).to_s + '
Hours_05_06_GMT,F=0
Hours_05_06_GMT,1=0
Hours_05_06_GMT,2=1
Hours_05_06_GMT,3=1
Hours_06_07_GMT=' + (self.hours_06_07_GMT ? 1 : 0).to_s + '
Hours_06_07_GMT,F=0
Hours_06_07_GMT,1=0
Hours_06_07_GMT,2=1
Hours_06_07_GMT,3=1
Hours_07_08_GMT=' + (self.hours_07_08_GMT ? 1 : 0).to_s + '
Hours_07_08_GMT,F=0
Hours_07_08_GMT,1=0
Hours_07_08_GMT,2=1
Hours_07_08_GMT,3=1
Hours_08_09_GMT=' + (self.hours_08_09_GMT ? 1 : 0).to_s + '
Hours_08_09_GMT,F=0
Hours_08_09_GMT,1=0
Hours_08_09_GMT,2=1
Hours_08_09_GMT,3=1
Hours_09_10_GMT=' + (self.hours_09_10_GMT ? 1 : 0).to_s + '
Hours_09_10_GMT,F=0
Hours_09_10_GMT,1=0
Hours_09_10_GMT,2=1
Hours_09_10_GMT,3=1
Hours_10_11_GMT=' + (self.hours_10_11_GMT ? 1 : 0).to_s + '
Hours_10_11_GMT,F=0
Hours_10_11_GMT,1=0
Hours_10_11_GMT,2=1
Hours_10_11_GMT,3=1
Hours_11_12_GMT=' + (self.hours_11_12_GMT ? 1 : 0).to_s + '
Hours_11_12_GMT,F=0
Hours_11_12_GMT,1=0
Hours_11_12_GMT,2=1
Hours_11_12_GMT,3=1
Hours_12_13_GMT=' + (self.hours_12_13_GMT ? 1 : 0).to_s + '
Hours_12_13_GMT,F=0
Hours_12_13_GMT,1=0
Hours_12_13_GMT,2=1
Hours_12_13_GMT,3=1
Hours_13_14_GMT=' + (self.hours_13_14_GMT ? 1 : 0).to_s + '
Hours_13_14_GMT,F=0
Hours_13_14_GMT,1=0
Hours_13_14_GMT,2=1
Hours_13_14_GMT,3=1
Hours_14_15_GMT=' + (self.hours_14_15_GMT ? 1 : 0).to_s + '
Hours_14_15_GMT,F=0
Hours_14_15_GMT,1=0
Hours_14_15_GMT,2=1
Hours_14_15_GMT,3=1
Hours_15_16_GMT=' + (self.hours_15_16_GMT ? 1 : 0).to_s + '
Hours_15_16_GMT,F=0
Hours_15_16_GMT,1=0
Hours_15_16_GMT,2=1
Hours_15_16_GMT,3=1
Hours_16_17_GMT=' + (self.hours_16_17_GMT ? 1 : 0).to_s + '
Hours_16_17_GMT,F=0
Hours_16_17_GMT,1=0
Hours_16_17_GMT,2=1
Hours_16_17_GMT,3=1
Hours_17_18_GMT=' + (self.hours_17_18_GMT ? 1 : 0).to_s + '
Hours_17_18_GMT,F=0
Hours_17_18_GMT,1=0
Hours_17_18_GMT,2=1
Hours_17_18_GMT,3=1
Hours_18_19_GMT=' + (self.hours_18_19_GMT ? 1 : 0).to_s + '
Hours_18_19_GMT,F=0
Hours_18_19_GMT,1=0
Hours_18_19_GMT,2=1
Hours_18_19_GMT,3=1
Hours_19_20_GMT=' + (self.hours_19_20_GMT ? 1 : 0).to_s + '
Hours_19_20_GMT,F=0
Hours_19_20_GMT,1=0
Hours_19_20_GMT,2=1
Hours_19_20_GMT,3=1
Hours_20_21_GMT=' + (self.hours_20_21_GMT ? 1 : 0).to_s + '
Hours_20_21_GMT,F=0
Hours_20_21_GMT,1=0
Hours_20_21_GMT,2=1
Hours_20_21_GMT,3=1
Hours_21_22_GMT=' + (self.hours_21_22_GMT ? 1 : 0).to_s + '
Hours_21_22_GMT,F=0
Hours_21_22_GMT,1=0
Hours_21_22_GMT,2=1
Hours_21_22_GMT,3=1
Hours_22_23_GMT=' + (self.hours_22_23_GMT ? 1 : 0).to_s + '
Hours_22_23_GMT,F=0
Hours_22_23_GMT,1=0
Hours_22_23_GMT,2=1
Hours_22_23_GMT,3=1
Hours_23_00_GMT=' + (self.hours_23_00_GMT ? 1 : 0).to_s + '
Hours_23_00_GMT,F=0
Hours_23_00_GMT,1=0
Hours_23_00_GMT,2=1
Hours_23_00_GMT,3=1
_inp9_= --- DAYS MANAGEMENT ---
Sunday.On=' + (self.sunday_on ? 1 : 0).to_s + '
Sunday.On,F=0
Sunday.On,1=0
Sunday.On,2=1
Sunday.On,3=1
Monday.On=' + (self.monday_on ? 1 : 0).to_s + '
Monday.On,F=0
Monday.On,1=0
Monday.On,2=1
Monday.On,3=1
Tuesday.On=' + (self.tuesday_on ? 1 : 0).to_s + '
Tuesday.On,F=0
Tuesday.On,1=0
Tuesday.On,2=1
Tuesday.On,3=1
Wednesday.On=' + (self.wednesday_on ? 1 : 0).to_s + '
Wednesday.On,F=0
Wednesday.On,1=0
Wednesday.On,2=1
Wednesday.On,3=1
Thursday.On=' + (self.thursday_on ? 1 : 0).to_s + '
Thursday.On,F=0
Thursday.On,1=0
Thursday.On,2=1
Thursday.On,3=1
Friday.On=' + (self.friday_on ? 1 : 0).to_s + '
Friday.On,F=0
Friday.On,1=0
Friday.On,2=1
Friday.On,3=1
Saturday.On=' + (self.saturday_on ? 1 : 0).to_s + '
Saturday.On,F=0
Saturday.On,1=0
Saturday.On,2=0
Saturday.On,3=0
Mon.FirstEntryHour.ON=' + (self.mon_first_entry_hour_on ? 1 : 0).to_s + '
Mon.FirstEntryHour.ON,F=0
Mon.FirstEntryHour.ON,1=0
Mon.FirstEntryHour.ON,2=0
Mon.FirstEntryHour.ON,3=0
Mon.FirstEntryHour_GMT=' + self.mon_first_entry_hour_GMT.to_s + '
Mon.FirstEntryHour_GMT,F=0
Mon.FirstEntryHour_GMT,1=0
Mon.FirstEntryHour_GMT,2=0
Mon.FirstEntryHour_GMT,3=0
Mon.MorningExitHour.ON=' + (self.mon_morning_exit_hour_on ? 1 : 0).to_s + '
Mon.MorningExitHour.ON,F=0
Mon.MorningExitHour.ON,1=0
Mon.MorningExitHour.ON,2=0
Mon.MorningExitHour.ON,3=0
Mon.MorningExitHour_GMT=' + self.mon_morning_exit_hour_GMT.to_s + '
Mon.MorningExitHour_GMT,F=0
Mon.MorningExitHour_GMT,1=0
Mon.MorningExitHour_GMT,2=0
Mon.MorningExitHour_GMT,3=0
Tue.MorningExitHour.ON=' + (self.tue_morning_exit_hour_on ? 1 : 0).to_s + '
Tue.MorningExitHour.ON,F=0
Tue.MorningExitHour.ON,1=0
Tue.MorningExitHour.ON,2=0
Tue.MorningExitHour.ON,3=0
Tue.MorningExitHour_GMT=' + self.tue_morning_exit_hour_GMT.to_s + '
Tue.MorningExitHour_GMT,F=0
Tue.MorningExitHour_GMT,1=0
Tue.MorningExitHour_GMT,2=0
Tue.MorningExitHour_GMT,3=0
Wed.MorningExitHour.ON=' + (self.wed_morning_exit_hour_on ? 1 : 0).to_s + '
Wed.MorningExitHour.ON,F=0
Wed.MorningExitHour.ON,1=0
Wed.MorningExitHour.ON,2=0
Wed.MorningExitHour.ON,3=0
Wed.MorningExitHour_GMT=' + self.wed_morning_exit_hour_GMT.to_s + '
Wed.MorningExitHour_GMT,F=0
Wed.MorningExitHour_GMT,1=0
Wed.MorningExitHour_GMT,2=0
Wed.MorningExitHour_GMT,3=0
Thu.MorningExitHour.ON=' + (self.thu_morning_exit_hour_on ? 1 : 0).to_s + '
Thu.MorningExitHour.ON,F=0
Thu.MorningExitHour.ON,1=0
Thu.MorningExitHour.ON,2=0
Thu.MorningExitHour.ON,3=0
Thu.MorningExitHour_GMT=' + self.thu_morning_exit_hour_GMT.to_s + '
Thu.MorningExitHour_GMT,F=0
Thu.MorningExitHour_GMT,1=0
Thu.MorningExitHour_GMT,2=0
Thu.MorningExitHour_GMT,3=0
Fri.MorningExitHour.ON=' + (self.fri_morning_exit_hour_on ? 1 : 0).to_s + '
Fri.MorningExitHour.ON,F=0
Fri.MorningExitHour.ON,1=1
Fri.MorningExitHour.ON,2=0
Fri.MorningExitHour.ON,3=0
Fri.MorningExitHour_GMT=' + self.fri_morning_exit_hour_GMT.to_s + '
Fri.MorningExitHour_GMT,F=0
Fri.MorningExitHour_GMT,1=21
Fri.MorningExitHour_GMT,2=0
Fri.MorningExitHour_GMT,3=0
Friday.ExitTradesHour_GMT=' + self.friday_exit_trades_hour_GMT.to_s + '
Friday.ExitTradesHour_GMT,F=0
Friday.ExitTradesHour_GMT,1=0
Friday.ExitTradesHour_GMT,2=5
Friday.ExitTradesHour_GMT,3=15
Friday.LastEntryHour_GMT=' + self.friday_last_entry_hour_GMT.to_s + '
Friday.LastEntryHour_GMT,F=0
Friday.LastEntryHour_GMT,1=19
Friday.LastEntryHour_GMT,2=1
Friday.LastEntryHour_GMT,3=21
_inp10_= --- LABELS SETTINGS --- 
Acc.Label.ON=' + (self.acc_label_on ? 1 : 0).to_s + '
Magic.Label.ON=' + (self.magic_label_on ? 1 : 0).to_s + '
Entry.Label.ON=' + (self.entry_label_on ? 1 : 0).to_s + '
Lbl.Font=' + self.lbl_font.to_s + '
Lbl.Font.Size=' + self.lbl_font_size.to_s + '
Lbl.Font.Size,F=0
Lbl.Font.Size,1=0
Lbl.Font.Size,2=0
Lbl.Font.Size,3=0
Lbl.Basic.Clr=' + self.lbl_basic_colour.to_s + '
Lbl.OK.Clr=' + self.lbl_ok_colour.to_s + '
Lbl.NOT.OK.Clr=' + self.lbl_not_ok_colour.to_s + '
Lbl.Uptrend.Clr=' + self.lbl_uptrend_colour.to_s + '
Lbl.Downtrend.Clr=' + self.lbl_downtrend_colour.to_s + '
_inp11_= --- COLOURS SETTINGS---
Long.Entry.Clr=' + self.long_entry_colour.to_s + '
Long.Profit.Clr=' + self.long_profit_colour.to_s + '
Long.Loss.Clr=' + self.long_loss_colour.to_s + '
Long.Stop.Clr=' + self.long_stop_colour.to_s + '
Short.Entry.Clr=' + self.short_entry_colour.to_s + '
Short.Profit.Clr=' + self.short_profit_colour.to_s + '
Short.Loss.Clr=' + self.short_loss_colour.to_s + '
Short.Stop.Clr=' + self.short_stop_colour.to_s + '
Trailing.SL.Clr=' + self.trailing_sl_colour.to_s
  end
end
