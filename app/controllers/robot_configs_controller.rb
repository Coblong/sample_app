class RobotConfigsController < ApplicationController
  before_filter :signed_in_user

  def download
    puts 'Downloading'
    puts 'Robot Config Id = ' + params[:id]
    robot_config = RobotConfig.find(params[:id])
    puts 'Robot is ' + robot_config.robot.name

    send_data robot_config.as_set_file, :filename => robot_config.robot.name + ".set", :type => "text/html"
  end

end