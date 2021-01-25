class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_user,           only:   %i[show edit update]

  def show
    authorize @user
  end

  def index
    @users = User.all
    authorize User
  end

  def edit
    authorize @user
  end

  def update
    authorize @user

    if @user.update(user_params)
      redirect_to users_url, notice: 'User was updated'
    else
      render action: 'edit'
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:role)
    end
end
