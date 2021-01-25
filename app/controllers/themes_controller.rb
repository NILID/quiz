class ThemesController < ApplicationController
  before_action :authenticate_user!

  after_action :verify_authorized

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
    def theme_params
      params.require(:theme).permit(:title)
    end
end
