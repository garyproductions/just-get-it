class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :mod_user?
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action."
      redirect_to login_path
    end
  end

  def mod_user?
    if !current_user.mod?
      flash[:alert] = "You need to be a mod to perform that action"
      redirect_to user_path
    end
  end
end
