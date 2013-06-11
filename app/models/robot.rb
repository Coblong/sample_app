class Robot < ActiveRecord::Base
  attr_accessible :report, :upload_comment
  attr_accessor :report, :upload_comment
  belongs_to :user
  has_many :robot_configs, dependent: :destroy, :autosave => true
  has_many :trades, dependent: :destroy, :autosave => true
  
  validates :user_id, presence: true
  
  default_scope order: 'robots.id'

  def for_equity_chart (robot_config)
    
    data = [["", "Money"]]
    balance = BigDecimal('100000.00')
    trades.each do |t|
      hour = t.open_time.hour.to_i
      do_it = false
      
      if hour == 0
        do_it = robot_config.hours_00_01_GMT
      elsif hour == 1
        do_it = robot_config.hours_01_02_GMT
      elsif hour == 2
        do_it = robot_config.hours_02_03_GMT
      elsif hour == 3
        do_it = robot_config.hours_03_04_GMT
      elsif hour == 4
        do_it = robot_config.hours_04_05_GMT
      elsif hour == 5
        do_it = robot_config.hours_05_06_GMT
      elsif hour == 6
        do_it = robot_config.hours_06_07_GMT
      elsif hour == 7
        do_it = robot_config.hours_07_08_GMT
      elsif hour == 8
        do_it = robot_config.hours_08_09_GMT
      elsif hour == 9
        do_it = robot_config.hours_09_10_GMT
      elsif hour == 10
        do_it = robot_config.hours_10_11_GMT
      elsif hour == 11
        do_it = robot_config.hours_11_12_GMT
      elsif hour == 12
        do_it = robot_config.hours_12_13_GMT
      elsif hour == 13
        do_it = robot_config.hours_13_14_GMT
      elsif hour == 14
        do_it = robot_config.hours_14_15_GMT
      elsif hour == 15
        do_it = robot_config.hours_15_16_GMT
      elsif hour == 16
        do_it = robot_config.hours_16_17_GMT
      elsif hour == 17
        do_it = robot_config.hours_17_18_GMT
      elsif hour == 18
        do_it = robot_config.hours_18_19_GMT
      elsif hour == 19
        do_it = robot_config.hours_19_20_GMT
      elsif hour == 20
        do_it = robot_config.hours_20_21_GMT
      elsif hour == 21
        do_it = robot_config.hours_21_22_GMT
      elsif hour == 22
        do_it = robot_config.hours_22_23_GMT
      elsif hour == 23
        do_it = robot_config.hours_23_00_GMT
      end

      if do_it
        profit = BigDecimal((balance * t.profit_percentage).to_s)
        balance += profit
        balance = balance.truncate(2)
        data += [["", balance.to_i]]
      end
    end
    data
  end

  def name
    symbol + timeframe
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
end
