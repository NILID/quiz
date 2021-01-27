class ThemesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_theme, only: [:show]

  after_action :verify_authorized

  def show
    authorize @theme
  end

  def new
    authorize @theme
  end

  def create
    @theme = Theme.new(theme_params)
    authorize @theme

    respond_to do |format|
      if @theme.save
        format.js
      else
        format.js
      end
    end
  end

  private
    def set_theme
      @theme = Theme.find(params[:id])
    end


    def theme_params
      params.require(:theme).permit(:title)
    end
end
