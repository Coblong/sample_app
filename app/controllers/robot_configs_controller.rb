class RobotConfigsController < ApplicationController
  before_filter :signed_in_user

  def show
    @robot_config = RobotConfig.find(params[:id])
    @robot = @robot_config.robot
    @trades = @robot.trades.paginate(page: params[:page])
  end

  def update
    
    saving = params[:robot_config][:saving] == 'true'
    @robot_config = RobotConfig.find(params['id'])
    @robot = @robot_config.robot
    @trades = @robot.trades.paginate(page: params[:page])

    if saving
      create_new_config params
      flash[:success] = "Robot configuration saved!"
    else
      overwrite_hours params
      @robot_config.is_dirty = true
    end
    
    render 'show', id: @robot_config.id
  end

  def create_new_config(params)
    @robot_config = @robot_config.dup 
    @robot_config.instance_number += 1
    @robot_config.user = current_user
    overwrite_hours params
    @robot.save

    micropost = current_user.microposts.build()    
    micropost.robot_config = @robot_config
    micropost.content = @robot_config.user.name + ' just re-optimised a robot.<br>Check it out...'
    micropost.save
  end

  def auto
    @robot_config = RobotConfig.find(params['id'])
    @robot = @robot_config.robot
    @robot_config = @robot_config.dup 
    @robot_config.instance_number += 1
    @robot_config.user = current_user
    @trades = @robot.trades.paginate(page: params[:page])
    optimise
    
    flash[:success] = "Robot optimised!"
    render 'show', id: @robot_config.id
  end

  def overwrite_hours(params)
    
    @robot_config.hours_00_01_GMT = params[:robot_config][:hours_00_01_GMT]
    @robot_config.hours_01_02_GMT = params[:robot_config][:hours_01_02_GMT]
    @robot_config.hours_02_03_GMT = params[:robot_config][:hours_02_03_GMT]
    @robot_config.hours_03_04_GMT = params[:robot_config][:hours_03_04_GMT]
    @robot_config.hours_04_05_GMT = params[:robot_config][:hours_04_05_GMT]
    @robot_config.hours_05_06_GMT = params[:robot_config][:hours_05_06_GMT]
    @robot_config.hours_06_07_GMT = params[:robot_config][:hours_06_07_GMT]
    @robot_config.hours_07_08_GMT = params[:robot_config][:hours_07_08_GMT]
    @robot_config.hours_08_09_GMT = params[:robot_config][:hours_08_09_GMT]
    @robot_config.hours_09_10_GMT = params[:robot_config][:hours_09_10_GMT]
    @robot_config.hours_10_11_GMT = params[:robot_config][:hours_10_11_GMT]
    @robot_config.hours_11_12_GMT = params[:robot_config][:hours_11_12_GMT]
    @robot_config.hours_12_13_GMT = params[:robot_config][:hours_12_13_GMT]
    @robot_config.hours_13_14_GMT = params[:robot_config][:hours_13_14_GMT]
    @robot_config.hours_14_15_GMT = params[:robot_config][:hours_14_15_GMT]
    @robot_config.hours_15_16_GMT = params[:robot_config][:hours_15_16_GMT]
    @robot_config.hours_16_17_GMT = params[:robot_config][:hours_16_17_GMT]
    @robot_config.hours_17_18_GMT = params[:robot_config][:hours_17_18_GMT]
    @robot_config.hours_18_19_GMT = params[:robot_config][:hours_18_19_GMT]
    @robot_config.hours_19_20_GMT = params[:robot_config][:hours_19_20_GMT]
    @robot_config.hours_20_21_GMT = params[:robot_config][:hours_20_21_GMT]
    @robot_config.hours_21_22_GMT = params[:robot_config][:hours_21_22_GMT]
    @robot_config.hours_22_23_GMT = params[:robot_config][:hours_22_23_GMT]
    @robot_config.hours_23_00_GMT = params[:robot_config][:hours_23_00_GMT]

    calculate_real_profit_factor_and_drawdown @robot_config, @robot.trades 
  end

  def download
    robot_config = RobotConfig.find(params[:id])
    send_data robot_config.as_set_file, :filename => robot_config.robot.name + ".set", :type => "text/html"
  end

  def optimise
    gross_profit = 0
    gross_loss = 0

    balance_map = Hash.new

    @robot.trades.each do |trade|
      hour = trade.open_time.hour.to_i - @robot_config.broker_timezone.to_i
      balance = balance_map[hour] ||= BigDecimal("0")
      balance += trade.profit_percentage
      balance_map[hour] = balance       
    end

    @robot_config.hours_00_01_GMT = is_profitable(balance_map, 0)
    @robot_config.hours_01_02_GMT = is_profitable(balance_map, 1)
    @robot_config.hours_02_03_GMT = is_profitable(balance_map, 2)
    @robot_config.hours_03_04_GMT = is_profitable(balance_map, 3)
    @robot_config.hours_04_05_GMT = is_profitable(balance_map, 4)
    @robot_config.hours_05_06_GMT = is_profitable(balance_map, 5)
    @robot_config.hours_06_07_GMT = is_profitable(balance_map, 6)
    @robot_config.hours_07_08_GMT = is_profitable(balance_map, 7)
    @robot_config.hours_08_09_GMT = is_profitable(balance_map, 8)
    @robot_config.hours_09_10_GMT = is_profitable(balance_map, 9)
    @robot_config.hours_10_11_GMT = is_profitable(balance_map, 10)
    @robot_config.hours_11_12_GMT = is_profitable(balance_map, 11)
    @robot_config.hours_12_13_GMT = is_profitable(balance_map, 12)
    @robot_config.hours_13_14_GMT = is_profitable(balance_map, 13)
    @robot_config.hours_14_15_GMT = is_profitable(balance_map, 14)
    @robot_config.hours_15_16_GMT = is_profitable(balance_map, 15)
    @robot_config.hours_16_17_GMT = is_profitable(balance_map, 16)
    @robot_config.hours_17_18_GMT = is_profitable(balance_map, 17)
    @robot_config.hours_18_19_GMT = is_profitable(balance_map, 18)
    @robot_config.hours_19_20_GMT = is_profitable(balance_map, 19)
    @robot_config.hours_20_21_GMT = is_profitable(balance_map, 20)
    @robot_config.hours_21_22_GMT = is_profitable(balance_map, 21)
    @robot_config.hours_22_23_GMT = is_profitable(balance_map, 22)
    @robot_config.hours_23_00_GMT = is_profitable(balance_map, 23)
    
    calculate_real_profit_factor_and_drawdown @robot_config, @robot.trades

    @robot.been_optimised = true
    @robot.save

    micropost = current_user.microposts.build()    
    micropost.robot_config = @robot_config
    micropost.content = @robot_config.user.name + ' just optimised a robot.<br>Check it out...'
    micropost.save
  end

  def is_profitable (balance_map, hour)
    profit = balance_map[hour] || BigDecimal("0")    
    profit > 0
  end

end