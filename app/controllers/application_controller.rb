class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def initialize_forms
    if signed_in?
      @micropost  = current_user.microposts.build
      @robot  = current_user.robots.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @microposts = current_user.microposts
    end
  end

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end
end
