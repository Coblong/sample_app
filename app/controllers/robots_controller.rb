include RobotsHelper

class RobotsController < ApplicationController

  before_filter :signed_in_user, :initialize_forms
  before_filter :correct_user,   only: :destroy

  def create
    
    Robot.transaction do
      
      @robot = current_user.robots.create(params[:robot])    
      @robot_config = @robot.robot_configs.build()
      @robot_config.user = current_user
      @robot_config.instance_number = 1
      read_from_html()    
      
      begin
        @robot.save        
        micropost = current_user.microposts.build()    
        micropost.robot_config = @robot_config
        if @robot.upload_comment.length > 0
          micropost.content = current_user.name + ' - ' + @robot.upload_comment
        else  
          micropost.content = current_user.name + ' just uploaded a new robot.<br>Check it out...'
        end
        micropost.save
        
        flash[:success] = "Robot created!"
        redirect_to @robot_config
      rescue ActiveRecord::StatementInvalid
        @feed_items = []
        render 'static_pages/home'
      end
    end
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