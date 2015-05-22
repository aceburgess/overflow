class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(id: user.id)
    else
      flash[:warn] = "Invalid user authentication"
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end