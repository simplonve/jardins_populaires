class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_user
    if current_user.nil?
      flash[:error] = "You need to sign in or sign up."
      redirect_to login_url
    end
  end
  helper_method :authenticate_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if sessions[:user_id]
  end
  helper_method :current_user
end
