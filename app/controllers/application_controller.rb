class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :unauthorized_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def must_be_logged_in
    unless current_user
      flash[:warn] = "You must be logged in to view this page!"
      redirect_to root_path
    end
  end
end
