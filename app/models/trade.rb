class Trade < ActiveRecord::Base
  belongs_to :robot
  validates :robot_id, presence: true    

  def balance
    100000
  end

  def is_disabled(robot_config)

    if (!robot_config.hours_00_01_GMT and open_time.hour.to_i == offset_hour(robot_config, 0)) or
       (!robot_config.hours_01_02_GMT and open_time.hour.to_i == offset_hour(robot_config, 1)) or
       (!robot_config.hours_02_03_GMT and open_time.hour.to_i == offset_hour(robot_config, 2)) or
       (!robot_config.hours_03_04_GMT and open_time.hour.to_i == offset_hour(robot_config, 3)) or
       (!robot_config.hours_04_05_GMT and open_time.hour.to_i == offset_hour(robot_config, 4)) or
       (!robot_config.hours_05_06_GMT and open_time.hour.to_i == offset_hour(robot_config, 5)) or
       (!robot_config.hours_06_07_GMT and open_time.hour.to_i == offset_hour(robot_config, 6)) or
       (!robot_config.hours_07_08_GMT and open_time.hour.to_i == offset_hour(robot_config, 7)) or
       (!robot_config.hours_08_09_GMT and open_time.hour.to_i == offset_hour(robot_config, 8)) or
       (!robot_config.hours_09_10_GMT and open_time.hour.to_i == offset_hour(robot_config, 9)) or
       (!robot_config.hours_10_11_GMT and open_time.hour.to_i == offset_hour(robot_config, 10)) or
       (!robot_config.hours_11_12_GMT and open_time.hour.to_i == offset_hour(robot_config, 11)) or
       (!robot_config.hours_12_13_GMT and open_time.hour.to_i == offset_hour(robot_config, 12)) or
       (!robot_config.hours_13_14_GMT and open_time.hour.to_i == offset_hour(robot_config, 13)) or
       (!robot_config.hours_14_15_GMT and open_time.hour.to_i == offset_hour(robot_config, 14)) or
       (!robot_config.hours_15_16_GMT and open_time.hour.to_i == offset_hour(robot_config, 15)) or
       (!robot_config.hours_16_17_GMT and open_time.hour.to_i == offset_hour(robot_config, 16)) or
       (!robot_config.hours_17_18_GMT and open_time.hour.to_i == offset_hour(robot_config, 17)) or
       (!robot_config.hours_18_19_GMT and open_time.hour.to_i == offset_hour(robot_config, 18)) or
       (!robot_config.hours_19_20_GMT and open_time.hour.to_i == offset_hour(robot_config, 19)) or
       (!robot_config.hours_20_21_GMT and open_time.hour.to_i == offset_hour(robot_config, 20)) or
       (!robot_config.hours_21_22_GMT and open_time.hour.to_i == offset_hour(robot_config, 21)) or
       (!robot_config.hours_22_23_GMT and open_time.hour.to_i == offset_hour(robot_config, 22)) or
       (!robot_config.hours_23_00_GMT and open_time.hour.to_i == offset_hour(robot_config, 23)) 
       return true
    end
    return false
  end

  def offset_hour(robot_config, h)
    o_hour = h + robot_config.broker_timezone
    if o_hour > 23
      o_hour -= 24
    end
    return o_hour
  end
end
