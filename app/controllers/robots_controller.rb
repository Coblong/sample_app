include RobotsHelper

class RobotsController < ApplicationController

  before_filter :signed_in_user, :initialize_forms
  before_filter :correct_user,   only: :destroy

  def update
    puts 'updating'
    robot_config = RobotConfig.find(params[:robot_config][:id])
    respond_to do |format|
      puts 'returning'
      format.html { redirect_to :action => "show", :id => robot_config.robot_id, :config_id => robot_config.id, :robot_config => params[:robot_config] }
      format.js
    end    
  end

  def show
    @robot = Robot.find(params[:id])
    if params['config_id'] == nil
      @robot_config = @robot.robot_configs.first
    else
      @robot_config = RobotConfig.find(params['config_id'])
      if params[:robot_config] != nil
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
      end
    end
    @trades = @robot.trades.paginate(page: params[:page])
  end

  def create
    
    Robot.transaction do
      
      @robot = current_user.robots.create(params[:robot])    
      puts 'Created robot for user ' + @robot.user.name
      @robot_config = @robot.robot_configs.build()
      @robot_config.user = current_user
      puts 'Created raw config for user ' + @robot_config.user.name
      @robot_config.instance_number = 1
      read_from_html()    
      
      begin
        @robot.save        
        micropost = current_user.microposts.build()    
        micropost.robot_config = @robot_config
        if @robot.upload_comment.length > 0
          micropost.content = current_user.name + ' - ' + @robot.upload_comment
        else  
          micropost.content = current_user.name + ' just uploaded a new robot. Check it out...'
        end
        micropost.save
        
        flash[:success] = "Robot created!"
        redirect_to @robot
      rescue ActiveRecord::StatementInvalid
        @feed_items = []
        render 'static_pages/home'
      end
    end
  end

  def create_config
    @robot.save        
    flash[:success] = "Robot configuration saved!"
    redirect_to @robot
  end

  def destroy
    @robot.destroy
    redirect_to root_url
  end

  def index
    @robot_configs = RobotConfig.paginate(page: params[:page])
  end

  private

    def correct_user
      @robot = current_user.robots.find_by_id(params[:id])
      redirect_to root_url if @robot.nil?
    end

end