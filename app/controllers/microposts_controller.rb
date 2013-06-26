class MicropostsController < ApplicationController
  before_filter :signed_in_user, :initialize_forms
  before_filter :correct_user,   only: :destroy

  def create
    
    @micropost = current_user.microposts.build(params[:micropost])    
    if params[:robot_config_id] != nil
      @micropost.content = params[:content]
      parent_micropost = RobotConfig.find(params[:robot_config_id]).microposts.first 
      parent_micropost.robot_config.microposts << @micropost
    elsif params[:parent_id] != nil
      parent_micropost = Micropost.find(params[:parent_id])       
      @micropost.content = params[:content]
      parent_micropost.children << @micropost
    else
      @micropost.content = params[:content]
    end

    if !@micropost.valid?
      flash[:error] = 'Unable to save comment - ' + @micropost.errors.full_messages.first.to_s
    else
      if @micropost.save
        flash[:success] = "You posted a message!"
      else
        flash[:error] = 'Unable to save comment'
      end
    end

    if parent_micropost == nil or parent_micropost.robot_config == nil
      redirect_to @micropost.user
    else
      redirect_to controller: 'robots', action: "show", id: parent_micropost.robot_config.robot.id, config_id: parent_micropost.robot_config.id, robot_config: params[:robot_config]
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  def index
  end

  private

    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url if @micropost.nil?
    end
end