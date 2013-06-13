class MicropostsController < ApplicationController
  before_filter :signed_in_user, :initialize_forms
  before_filter :correct_user,   only: :destroy

  def create

    @micropost = current_user.microposts.build(params[:micropost])    
    if params[:parent_id] != nil
      parent_micropost = Micropost.find(params[:parent_id]) 
      @micropost.robot_config_id = parent_micropost.robot_config_id
      @micropost.content = params[:content]
      parent_micropost.children << @micropost
    else
      @micropost = current_user.microposts.build(params[:micropost])    
    end

    if !@micropost.valid?
      flash[:error] = 'Unable to save comment - ' + @micropost.errors.full_messages.first.to_s
    else
      if @micropost.save
        flash[:success] = "Micropost created!"
      else
        flash[:error] = 'Unable to save comment'
      end
    end

    if parent_micropost == nil
      redirect_to root_url 
    else
      redirect_to @micropost.robot_config.robot, :config_id => @micropost.robot_config_id
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