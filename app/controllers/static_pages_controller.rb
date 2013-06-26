class StaticPagesController < ApplicationController
  before_filter :initialize_forms

  def home
    @robot_configs = RobotConfig.paginate(page: params[:page])
    @microposts = Micropost.find(:all, :limit => 10)
  end
  
#      INNER JOIN robot_configs ON robots.robot_config_id = robot_configs.id
#      ORDER robot_configs.profit_factor desc
end
