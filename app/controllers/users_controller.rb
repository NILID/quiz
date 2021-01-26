class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_user,           only:   %i[show edit update]

  def show
    authorize @user
    @rounds = @user.rounds.order(created_at: :desc)
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
      redirect_to users_url, notice: t('flash.was_created', item: User.model_name.human)
    else
      render action: 'edit'
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      list_params = []
      list_params << [:role] if (current_user.admin?)

      params.require(:user).permit(list_params)
    end
end
