class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #  before_action :authenticate_user, except: [:new]
  helper_method :current_user

  def current_user
    # return @current_user if @current_user.present?

    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def authenticate_user
    if session.has_key?(:user_id)
      # do nothing
    else
      redirect_to new_session_path
    end
  end
end
