class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(id: @user.id)
    else
      flash[:warn] = "That is not a valid user!"
      redirect_to :back
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.save
      redirect_to user_path(id: @user.id)
    else
      flash[:warn] = "That is not a valid user!"
      redirect_to :back
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end