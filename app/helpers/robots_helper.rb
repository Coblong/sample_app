require 'nokogiri'
include ActionView::Helpers::NumberHelper

module RobotsHelper

  # trade row cell numbers
  TRADE_TIME_CELL = 1
  TRADE_TYPE_CELL = 2
  TRADE_ORDER_CELL = 3
  TRADE_PROFIT_CELL = 8
  TRADE_BALANCE_CELL = 9

  def read_from_html()

    report = Nokogiri::HTML(@robot.report)
    node_name = ''
    looking_at_trades = false
    trade_map = Hash.new        
    previous_trade_balance = 100000

    # Read the report line by line and set the relavant boolean to dictate which fieldto set next
    report.css('tr').each do |row|
      
      if looking_at_trades 
        # We are now inside the trades list
        
        cell_index = 0

        trade_time = nil
        trade_type = 0
        trade_order_id = 0
        trade_profit = 0
        trade_balance = 0        

        row.css('td').each do |cell|

          if cell_index == TRADE_TIME_CELL
            trade_time = Time.parse(cell.text.to_datetime.to_s)
          elsif cell_index == TRADE_TYPE_CELL
            trade_type = cell.text
          elsif cell_index == TRADE_ORDER_CELL
            trade_order_id = cell.text
          elsif cell_index == TRADE_PROFIT_CELL
            trade_profit = cell.text.to_f
          elsif cell_index == TRADE_BALANCE_CELL
            trade_balance = cell.text.to_f
          end

          cell_index += 1
        end

        trade = trade_map[trade_order_id]
        if trade == nil 
          trade = @robot.trades.build()
          trade_map[trade_order_id] = trade
        end
        trade.order_id = trade_order_id
        
        if trade_type == "buy"
          trade.direction = 'long'
          trade.open_time = trade_time
        elsif trade_type == "sell"
          trade.direction = 'short'
          trade.open_time = trade_time
        elsif trade_type == "close" or trade_type == "close at stop" or trade_type == 't/p'
          trade.duration = (trade_time - trade.open_time).to_i / 60
          trade.stopped_out = false
          trade.profit_percentage = trade_profit / previous_trade_balance
          previous_trade_balance = trade_balance
        elsif trade_type == "s/l"
          trade.duration = (trade_time.to_i - trade.open_time.to_i) / 60
          trade.stopped_out = true
          trade.profit_percentage = trade_profit / previous_trade_balance
          previous_trade_balance = trade_balance
        end
      else
        row.css('td').each do |cell|
          if node_name.eql? "AVERAGE CONSECUTIVE LOSSES"
            @robot_config.average_consecutive_losses = get_first(cell.text)
          elsif node_name.eql? "AVERAGE CONSECUTIVE WINS"
            @robot_config.average_consecutive_wins = get_first(cell.text)
          elsif node_name.eql? "CONSECUTIVE LOSSES (LOSS IN MONEY)"
            @robot_config.most_consecutive_losses = get_first(cell.text)
            @robot_config.most_consecutive_losses_in_money = get_second(cell.text)            
          elsif node_name.eql? "MAX CONSECUTIVE WINS"
            @robot_config.most_consecutive_wins = get_first(cell.text)
            @robot_config.most_consecutive_wins_in_money = get_second(cell.text)
          elsif node_name.eql? "AVERAGE LOSS"
            @robot_config.average_loss = get_first(cell.text)
          elsif node_name.eql? "AVERAGE PROFIT"
            @robot_config.average_profit = get_first(cell.text)
          elsif node_name.eql? "LARGEST LOSS"
            @robot_config.largest_loss = get_first(cell.text)
          elsif node_name.eql? "LARGEST PROFIT"
            @robot_config.largest_profit = get_first(cell.text)
          elsif node_name.eql? "LOSS TRADES"
            @robot_config.loss_trades = get_first(cell.text)
          elsif node_name.eql? "PROFIT TRADES"
            @robot_config.profit_trades = get_first(cell.text)
          elsif node_name.eql? "LONG POSITIONS WON"
            @robot_config.long_positions_won = get_first(cell.text)
          elsif node_name.eql? "SHORT POSITIONS WON"
            @robot_config.short_positions_won = get_first(cell.text)
          elsif node_name.eql? "TOTAL TRADES"
            @robot_config.total_trades = get_first(cell.text)
          elsif node_name.eql? "RELATIVE DRAWDOWN"
            @robot_config.relative_drawdown = get_first(cell.text)
            @robot_config.relative_drawdown_percentage = get_second(cell.text)
          elsif node_name.eql? "MAXIMAL DRAWDOWN"
            @robot_config.maximal_drawdown = get_first(cell.text)
            @robot_config.maximal_drawdown_percentage = get_second(cell.text)
          elsif node_name.eql? "ABSOLUTE DRAWDOWN"
            @robot_config.absolute_drawdown = get_first(cell.text)
          elsif node_name.eql? "EXPECTED PAYOFF"
            @robot_config.expected_payoff = get_first(cell.text)
          elsif node_name.eql? "PROFIT FACTOR"
            @robot_config.profit_factor = get_first(cell.text)
          elsif node_name.eql? "GROSS LOSS"
            @robot_config.gross_loss = get_first(cell.text)
          elsif node_name.eql? "GROSS PROFIT"              
            @robot_config.gross_profit = get_first(cell.text)
          elsif node_name.eql? "TOTAL NET PROFIT"
            @robot_config.total_net_profit = get_first(cell.text)
          elsif node_name.eql? "INITIAL DEPOSIT"
            @robot_config.initial_deposit = get_first(cell.text)
          elsif node_name.eql? "MISMATCHED CHARTS ERRORS"
            @robot_config.mismatched_chart_errors = get_first(cell.text)
          elsif node_name.eql? "MODELLING QUALITY"
            @robot_config.modelling_quality = get_first(cell.text)            
          elsif node_name.eql? "BARS IN TEST"
            @robot_config.bars_in_test = get_first(cell.text)
          elsif node_name.eql? "PARAMETERS"
            set_parameters(cell.text)
          elsif node_name.eql? "PERIOD"
            @robot.timeframe = get_second(cell.text)
            set_start_and_end_dates(cell.text)
          elsif node_name.eql? "SYMBOL"
            @robot.symbol = get_first(cell.text)
          end

          node_name = cell.text.upcase

          if node_name == '#'
            looking_at_trades = true
            # This was the header row for the trades table so break out as we already know the columns
            break
          end
        end
      end
    end      

    calculate_real_profit_factor_and_drawdown @robot_config, @robot.trades
  end

  def get_first(text) 
    if text.to_s.include?('(')
      text[0...(text.index("(") - 1)].chomp('%')
    else
      text.chomp('%')
    end
  end

  def get_second(text) 
    if text.to_s.include?('(')
      text[text.index("(")+1...(text.index(")"))].chomp('%')
    else
      text.chomp('%')
    end
  end

  def set_start_and_end_dates(text)
    start_index = text.index(")") + 3
    end_index = start_index + 16
    @robot.start_date = text[start_index...end_index].to_datetime
    
    start_index = end_index + 3
    end_index = start_index + 16
    @robot.end_date = text[start_index...end_index].to_datetime
  end

  def set_parameters(text)
    @robot_config.comment = get_param(text, "MyComment")
    @robot_config.magic_number = get_param(text, "Magic")
    @robot_config.hidden_orders = get_param(text, "HiddenOrders")
    @robot_config.account_digits = get_param(text, "AccDigits")
    @robot_config.fixed_lot = get_param(text, "FixedLot")
    @robot_config.risk_percentage = get_param(text, "RiskPcnt")
    @robot_config.max_relative_drawdown = get_param(text, "Max.Rel.Drawdown")
    @robot_config.max_consecutive_losses = get_param(text, "MaxConsecutiveLosses")
    @robot_config.account_target_blance = get_param(text, "Acc.Target.Bal")
    @robot_config.account_stop_balance = get_param(text, "Acc.Stop.Bal")
    @robot_config.drawdown_limiter_on = get_param(text, "Drawdown.Limiter.On")
    @robot_config.drawdown_limit_mode = get_param(text, "Drd.Lim.Mode")
    @robot_config.drawdown_limit_period = get_param(text, "Drd.Lim.Period")
    @robot_config.entry_envelopes = get_param(text, "Entry_Envelopes")
    @robot_config.envelope_period = get_param(text, "Envelope_Period")
    @robot_config.ma_type = get_param(text, "MA_Type")
    @robot_config.envelope_source = get_param(text, "Envelope_Source")
    @robot_config.max_spread = get_param(text, "Max_Spread")
    @robot_config.reset_envelopes = get_param(text, "Reset_Envelopes")
    @robot_config.fixed_range_stop_on = get_param(text, "Fixed_Range_Stop_On")
    @robot_config.fixed_range_stop_ratio = get_param(text, "Fixed_Range_Stop_Ratio")
    @robot_config.dynamic_stop_envelopes = get_param(text, "Dynamic_Stop_Envelopes")
    @robot_config.stop_loss_pips = get_param(text, "Stop_Loss_Pips")
    @robot_config.trailing_stop = get_param(text, "Trailing_Stop")
    @robot_config.take_profit_pips = get_param(text, "Take_Profit_Pips")
    @robot_config.target_envelopes = get_param(text, "Target_Envelopes")
    @robot_config.max_trade_duration = get_param(text, "Max_Trade_Duration")
    @robot_config.ema_trend_filter = get_param(text, "EMA_Trend_Filter")
    @robot_config.ema_trend_fast_per = get_param(text, "EMA_Trend_Fast_Per")
    @robot_config.ema_trend_slow_per = get_param(text, "EMA_Trend_Slow_Per")
    @robot_config.ema2_trend_filter = get_param(text, "EMA2_Trend_Filter")
    @robot_config.ema2_trend_tf = get_param(text, "EMA2_Trend_TF")
    @robot_config.ema2_trend_fast_per = get_param(text, "EMA2_Trend_Fast_Per")
    @robot_config.ema2_trend_slow_per = get_param(text, "EMA2_Trend_Slow_Per")
    @robot_config.ema3_trend_filter = get_param(text, "EMA3_Trend_Filter")
    @robot_config.ema3_trend_tf = get_param(text, "EMA3_Trend_TF")
    @robot_config.ema3_trend_fast_per = get_param(text, "EMA3_Trend_Fast_Per")
    @robot_config.ema3_trend_slow_per = get_param(text, "EMA3_Trend_Slow_Per")
    @robot_config.ema4_trend_filter = get_param(text, "EMA4_Trend_Filter")
    @robot_config.ema4_trend_tf = get_param(text, "EMA4_Trend_TF")
    @robot_config.ema4_trend_fast_per = get_param(text, "EMA4_Trend_Fast_Per")
    @robot_config.ema4_trend_slow_per = get_param(text, "EMA4_Trend_Slow_Per")
    @robot_config.bbands_tf = get_param(text, "BBands.TF")
    @robot_config.bbands_period = get_param(text, "BBands.Period")
    @robot_config.bbands_deviation = get_param(text, "BBands.Deviation")
    @robot_config.bbands_applied_price = get_param(text, "BBands.AppliedPrice")
    @robot_config.bbands_narrowing = get_param(text, "BBands.Narrowing")
    @robot_config.bbands_check_max_pips = get_param(text, "BBands.CheckMaxPips")
    @robot_config.bbands_max_pips = get_param(text, "BBands.MaxPips")
    @robot_config.broker_timezone = get_param(text, "Broker.TimeZone")
    @robot_config.hours_00_01_GMT = get_param(text, "Hours_00_01_GMT")
    @robot_config.hours_01_02_GMT = get_param(text, "Hours_01_02_GMT")
    @robot_config.hours_02_03_GMT = get_param(text, "Hours_02_03_GMT")
    @robot_config.hours_03_04_GMT = get_param(text, "Hours_03_04_GMT")
    @robot_config.hours_04_05_GMT = get_param(text, "Hours_04_05_GMT")
    @robot_config.hours_05_06_GMT = get_param(text, "Hours_05_06_GMT")
    @robot_config.hours_06_07_GMT = get_param(text, "Hours_06_07_GMT")
    @robot_config.hours_07_08_GMT = get_param(text, "Hours_07_08_GMT")
    @robot_config.hours_08_09_GMT = get_param(text, "Hours_08_09_GMT")
    @robot_config.hours_09_10_GMT = get_param(text, "Hours_09_10_GMT")
    @robot_config.hours_10_11_GMT = get_param(text, "Hours_10_11_GMT")
    @robot_config.hours_11_12_GMT = get_param(text, "Hours_11_12_GMT")
    @robot_config.hours_12_13_GMT = get_param(text, "Hours_12_13_GMT")
    @robot_config.hours_13_14_GMT = get_param(text, "Hours_13_14_GMT")
    @robot_config.hours_14_15_GMT = get_param(text, "Hours_14_15_GMT")
    @robot_config.hours_15_16_GMT = get_param(text, "Hours_15_16_GMT")
    @robot_config.hours_16_17_GMT = get_param(text, "Hours_16_17_GMT")
    @robot_config.hours_17_18_GMT = get_param(text, "Hours_17_18_GMT")
    @robot_config.hours_18_19_GMT = get_param(text, "Hours_18_19_GMT")
    @robot_config.hours_19_20_GMT = get_param(text, "Hours_19_20_GMT")
    @robot_config.hours_20_21_GMT = get_param(text, "Hours_20_21_GMT")
    @robot_config.hours_21_22_GMT = get_param(text, "Hours_21_22_GMT")
    @robot_config.hours_22_23_GMT = get_param(text, "Hours_22_23_GMT")
    @robot_config.hours_23_00_GMT = get_param(text, "Hours_23_00_GMT")
    @robot_config.sunday_on = get_param(text, "Sunday.On")
    @robot_config.monday_on = get_param(text, "Monday.On")
    @robot_config.tuesday_on = get_param(text, "Tuesday.On")
    @robot_config.wednesday_on = get_param(text, "Wednesday.On")
    @robot_config.thursday_on = get_param(text, "Friday.On")
    @robot_config.friday_on = get_param(text, "Thursday.On")
    @robot_config.saturday_on = get_param(text, "Saturday.On")
    @robot_config.mon_first_entry_hour_on = get_param(text, "Mon.FirstEntryHour.ON")
    @robot_config.mon_first_entry_hour_GMT = get_param(text, "Mon.FirstEntryHour_GMT")
    @robot_config.mon_morning_exit_hour_on = get_param(text, "Mon.MorningExitHour.ON")
    @robot_config.mon_morning_exit_hour_GMT = get_param(text, "Mon.MorningExitHour_GMT")
    @robot_config.tue_morning_exit_hour_on = get_param(text, "Tue.MorningExitHour.ON")
    @robot_config.tue_morning_exit_hour_GMT = get_param(text, "Tue.MorningExitHour_GMT")
    @robot_config.wed_morning_exit_hour_on = get_param(text, "Wed.MorningExitHour.ON")
    @robot_config.wed_morning_exit_hour_GMT = get_param(text, "Wed.MorningExitHour_GMT")
    @robot_config.thu_morning_exit_hour_on = get_param(text, "Thu.MorningExitHour.ON")
    @robot_config.thu_morning_exit_hour_GMT  = get_param(text, "Thu.MorningExitHour_GMT")
    @robot_config.fri_morning_exit_hour_on = get_param(text, "Fri.MorningExitHour.ON")
    @robot_config.fri_morning_exit_hour_GMT = get_param(text, "Fri.MorningExitHour_GMT")
    @robot_config.friday_exit_trades_hour_GMT = get_param(text, "Friday.ExitTradesHour_GMT")
    @robot_config.friday_last_entry_hour_GMT = get_param(text, "Friday.LastEntryHour_GMT")
    @robot_config.acc_label_on = get_param(text, "Acc.Label.ON")
    @robot_config.magic_label_on = get_param(text, "Magic.Label.ON")
    @robot_config.entry_label_on = get_param(text, "Entry.Label.ON")
    @robot_config.lbl_font = get_param(text, "Lbl.Font")
    @robot_config.lbl_font_size = get_param(text, "Lbl.Font.Size")
    @robot_config.lbl_basic_colour  = get_param(text, "Lbl.Basic.Clr")
    @robot_config.lbl_ok_colour = get_param(text, "Lbl.OK.Clr")
    @robot_config.lbl_not_ok_colour = get_param(text, "Lbl.NOT.OK.Clr")
    @robot_config.lbl_uptrend_colour = get_param(text, "Lbl.Uptrend.Clr")
    @robot_config.lbl_downtrend_colour  = get_param(text, "Lbl.Downtrend.Clr")
    @robot_config.long_entry_colour  = get_param(text, "Long.Entry.Clr")
    @robot_config.long_profit_colour = get_param(text, "Long.Profit.Clr")
    @robot_config.long_loss_colour  = get_param(text, "Long.Loss.Clr")
    @robot_config.long_stop_colour = get_param(text, "Long.Stop.Clr")
    @robot_config.short_entry_colour = get_param(text, "Short.Entry.Clr")
    @robot_config.short_profit_colour = get_param(text, "Short.Profit.Clr")
    @robot_config.short_loss_colour  = get_param(text, "Short.Loss.Clr")
    @robot_config.short_stop_colour = get_param(text, "Short.Stop.Clr")
    @robot_config.trailing_sl_colour = get_param(text, "Trailing.SL.Clr")
  end

  def get_param(text, param_name)
    stripped_string = text[text.index(param_name)+param_name.length+1...text.length]
    return stripped_string[0...stripped_string.index(";")].chomp('"').reverse.chomp('"').reverse
    rescue
      return ''
  end

  def calculate_real_profit_factor_and_drawdown (robot_config, trades)

    balance = BigDecimal('100000.00')
    pre_balance = balance
    gross_profit = BigDecimal('0')
    gross_loss = BigDecimal('0')
    max_relative_drawdown = 0
    robot_config.trade_count = 0;

    trades.each do |trade|
      if !trade.is_disabled(robot_config)
        pandl = BigDecimal((balance * trade.profit_percentage).to_s)     
        balance += pandl
        balance = balance.truncate(2)

        pre_balance = balance if balance > pre_balance
        
        if pandl > 0
          gross_profit += pandl
        elsif trade.profit_percentage < 0
          gross_loss -= pandl
          drawdown = (pre_balance - balance) / pre_balance * 100
          if drawdown >= max_relative_drawdown
            max_relative_drawdown = drawdown
          end
        end
        robot_config.trade_count += 1
      end
    end
  
    robot_config.end_balance = balance
    robot_config.real_gross_profit = gross_profit
    robot_config.real_gross_loss = gross_loss
    robot_config.real_profit_factor = number_with_precision(gross_profit / gross_loss, precision: 2)
    robot_config.real_drawdown = number_with_precision(max_relative_drawdown, precision: 2)
  end

end
