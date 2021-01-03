class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
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
