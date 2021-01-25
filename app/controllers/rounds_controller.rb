class RoundsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_round, only: [:show, :destroy, :result]
  after_action :verify_authorized

  def index
    authorize Round

    @rounds = Round.all
  end

  def show
    authorize @round

    @all_questions = Question.where(id: @round.questions_collection)
    @pagy, @questions = pagy(@all_questions, items: 1)
  end

  def result
    authorize @round

    @round.update_attribute(:finished, true)
  end

  def new
    @round = Round.new(theme_id: params[:theme_id])
    @round.user = current_user

    authorize @round

    respond_to do |format|
      if @round.save
        format.html { redirect_to @round, notice: 'Round was successfully created.' }
        format.json { render :show, status: :created, location: @round }
      else
        format.html { render :new }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_round
      @round = Round.find(params[:id])
    end

    def round_params
      params.require(:round).permit(:theme_id, :user_id, :current_answers, :wrong_answers, :finished)
    end
end
