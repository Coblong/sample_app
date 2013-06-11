# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130609192453) do

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "robot_config_id"
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "robot_configs", :force => true do |t|
    t.integer  "robot_id"
    t.integer  "bars_in_test"
    t.decimal  "modelling_quality",                :precision => 2, :scale => 2
    t.integer  "mismatched_chart_errors"
    t.decimal  "initial_deposit",                  :precision => 2, :scale => 2
    t.decimal  "total_net_profit",                 :precision => 2, :scale => 2
    t.decimal  "gross_profit",                     :precision => 2, :scale => 2
    t.decimal  "gross_loss",                       :precision => 2, :scale => 2
    t.decimal  "profit_factor",                    :precision => 2, :scale => 2
    t.decimal  "expected_payoff",                  :precision => 2, :scale => 2
    t.decimal  "absolute_drawdown",                :precision => 2, :scale => 2
    t.decimal  "maximal_drawdown",                 :precision => 2, :scale => 2
    t.decimal  "maximal_drawdown_percentage",      :precision => 2, :scale => 2
    t.decimal  "relative_drawdown",                :precision => 2, :scale => 2
    t.decimal  "relative_drawdown_percentage",     :precision => 2, :scale => 2
    t.integer  "total_trades"
    t.integer  "short_positions_won"
    t.integer  "long_positions_won"
    t.integer  "profit_trades"
    t.integer  "loss_trades"
    t.decimal  "largest_profit",                   :precision => 2, :scale => 2
    t.decimal  "largest_loss",                     :precision => 2, :scale => 2
    t.decimal  "average_profit",                   :precision => 2, :scale => 2
    t.decimal  "average_loss",                     :precision => 2, :scale => 2
    t.integer  "most_consecutive_wins"
    t.decimal  "most_consecutive_wins_in_money",   :precision => 2, :scale => 2
    t.integer  "most_consecutive_losses"
    t.integer  "average_consecutive_wins"
    t.integer  "average_consecutive_losses"
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
    t.string   "comment"
    t.integer  "magic_number"
    t.integer  "account_digits"
    t.integer  "fixed_lot"
    t.decimal  "risk_percentage"
    t.integer  "max_relative_drawdown"
    t.integer  "max_consecutive_losses"
    t.integer  "account_target_blance"
    t.integer  "account_stop_balance"
    t.boolean  "drawdown_limiter_on"
    t.string   "drawdown_limit_mode"
    t.integer  "drawdown_limit_period"
    t.decimal  "entry_envelopes",                  :precision => 8, :scale => 3
    t.integer  "envelope_period"
    t.integer  "ma_type"
    t.integer  "envelope_source"
    t.decimal  "max_spread",                       :precision => 2, :scale => 2
    t.decimal  "reset_envelopes",                  :precision => 8, :scale => 3
    t.boolean  "fixed_range_stop_on"
    t.decimal  "fixed_range_stop_ratio",           :precision => 8, :scale => 3
    t.integer  "dynamic_stop_envelopes"
    t.integer  "stop_loss_pips"
    t.integer  "trailing_stop"
    t.integer  "take_profit_pips"
    t.decimal  "target_envelopes",                 :precision => 8, :scale => 3
    t.integer  "max_trade_duration"
    t.boolean  "ema_trend_filter"
    t.integer  "ema_trend_fast_per"
    t.integer  "ema_trend_slow_per"
    t.boolean  "ema2_trend_filter"
    t.integer  "ema2_trend_tf"
    t.integer  "ema2_trend_fast_per"
    t.integer  "ema2_trend_slow_per"
    t.boolean  "ema3_trend_filter"
    t.integer  "ema3_trend_tf"
    t.integer  "ema3_trend_fast_per"
    t.integer  "ema3_trend_slow_per"
    t.boolean  "ema4_trend_filter"
    t.integer  "ema4_trend_tf"
    t.integer  "ema4_trend_fast_per"
    t.integer  "ema4_trend_slow_per"
    t.integer  "bbands_tf"
    t.integer  "bbands_period"
    t.integer  "bbands_deviation"
    t.integer  "bbands_applied_price"
    t.boolean  "bbands_narrowing"
    t.boolean  "bbands_check_max_pips"
    t.integer  "bbands_max_pips"
    t.integer  "broker_timezone"
    t.boolean  "hours_00_01_GMT"
    t.boolean  "hours_01_02_GMT"
    t.boolean  "hours_02_03_GMT"
    t.boolean  "hours_03_04_GMT"
    t.boolean  "hours_04_05_GMT"
    t.boolean  "hours_05_06_GMT"
    t.boolean  "hours_06_07_GMT"
    t.boolean  "hours_07_08_GMT"
    t.boolean  "hours_08_09_GMT"
    t.boolean  "hours_09_10_GMT"
    t.boolean  "hours_10_11_GMT"
    t.boolean  "hours_11_12_GMT"
    t.boolean  "hours_12_13_GMT"
    t.boolean  "hours_13_14_GMT"
    t.boolean  "hours_14_15_GMT"
    t.boolean  "hours_15_16_GMT"
    t.boolean  "hours_16_17_GMT"
    t.boolean  "hours_17_18_GMT"
    t.boolean  "hours_18_19_GMT"
    t.boolean  "hours_19_20_GMT"
    t.boolean  "hours_20_21_GMT"
    t.boolean  "hours_21_22_GMT"
    t.boolean  "hours_22_23_GMT"
    t.boolean  "hours_23_00_GMT"
    t.boolean  "sunday_on"
    t.boolean  "monday_on"
    t.boolean  "tuesday_on"
    t.boolean  "wednesday_on"
    t.boolean  "thursday_on"
    t.boolean  "friday_on"
    t.boolean  "saturday_on"
    t.boolean  "mon_first_entry_hour_on"
    t.integer  "mon_first_entry_hour_GMT"
    t.boolean  "mon_morning_exit_hour_on"
    t.integer  "mon_morning_exit_hour_GMT"
    t.boolean  "tue_morning_exit_hour_on"
    t.integer  "tue_morning_exit_hour_GMT"
    t.boolean  "wed_morning_exit_hour_on"
    t.integer  "wed_morning_exit_hour_GMT"
    t.boolean  "thu_morning_exit_hour_on"
    t.integer  "thu_morning_exit_hour_GMT"
    t.boolean  "fri_morning_exit_hour_on"
    t.integer  "fri_morning_exit_hour_GMT"
    t.integer  "friday_exit_trades_hour_GMT"
    t.integer  "friday_last_entry_hour_GMT"
    t.boolean  "acc_label_on"
    t.boolean  "magic_label_on"
    t.boolean  "entry_label_on"
    t.string   "lbl_font"
    t.integer  "lbl_font_size"
    t.string   "lbl_basic_colour"
    t.string   "lbl_ok_colour"
    t.string   "lbl_not_ok_colour"
    t.string   "lbl_uptrend_colour"
    t.string   "lbl_downtrend_colour"
    t.string   "long_entry_colour"
    t.string   "long_profit_colour"
    t.string   "long_loss_colour"
    t.string   "long_stop_colour"
    t.string   "short_entry_colour"
    t.string   "short_profit_colour"
    t.string   "short_loss_colour"
    t.string   "short_stop_colour"
    t.string   "trailing_sl_colour"
    t.boolean  "hidden_orders"
    t.decimal  "most_consecutive_losses_in_money", :precision => 2, :scale => 2
    t.integer  "instance_number"
    t.decimal  "real_profit_factor",               :precision => 2, :scale => 2
    t.decimal  "real_drawdown",                    :precision => 2, :scale => 2
    t.integer  "user_id"
  end

  add_index "robot_configs", ["robot_id", "created_at"], :name => "index_robot_configs_on_robot_id_and_created_at"
  add_index "robot_configs", ["user_id", "created_at"], :name => "index_robot_configs_on_user_id_and_created_at"

  create_table "robots", :force => true do |t|
    t.integer  "user_id"
    t.string   "symbol"
    t.string   "timeframe"
    t.string   "strategy"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "hidden_orders"
  end

  add_index "robots", ["user_id", "created_at"], :name => "index_robots_on_user_id_and_created_at"

  create_table "trades", :force => true do |t|
    t.integer  "robot_id"
    t.datetime "open_time"
    t.integer  "duration"
    t.string   "direction"
    t.integer  "order_id"
    t.decimal  "profit_percentage", :precision => 10, :scale => 10
    t.boolean  "stopped_out"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  add_index "trades", ["robot_id", "created_at"], :name => "index_trades_on_robot_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
