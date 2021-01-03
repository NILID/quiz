class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    authorize User
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user

    if @user.update(user_params)
      redirect_to root_url, notice: 'User was updated'
    else
      render action: 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:role)
    end
end
