class RobotConfigsController < ApplicationController
  before_filter :signed_in_user

  def update
    puts 'Updatinging data'
    
    @robot_config = RobotConfig.find(params[:id])
    
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
    
    respond_to do |format|
      format.html { redirect_to @robot_config.robot(config_id: @robot_config.id) }
      format.js
    end
  end

end