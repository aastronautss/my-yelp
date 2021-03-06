class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def access_denied(msg = "You aren't allowed to do that.", path = root_path)
    flash[:danger] = msg
    redirect_to path
  end

  def require_user
    access_denied('You must be logged in to do that.') unless logged_in?
  end

  def require_logged_out
    access_denied('You must be logged out to do that.') if logged_in?
  end

  def require_logged_in_as(user)
    access_denied unless current_user == user
  end
end
