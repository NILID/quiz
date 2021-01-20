class RoundsController < ApplicationController
  before_action :set_round, only: [:show, :edit, :update, :destroy]

  # GET /rounds
  # GET /rounds.json
  def index
    @rounds = Round.all
    @themes = Theme.order(:title)
  end

  # GET /rounds/1
  # GET /rounds/1.json
  def show
    @all_questions = Question.where(theme_id: @round.theme_id)
    @pagy, @questions = pagy(@all_questions, items: 1)
  end

  # GET /rounds/new
  def new
    @round = Round.new
  end

  # GET /rounds/1/edit
  def edit
  end

  # POST /rounds
  # POST /rounds.json
  def create
    @round = Round.new(round_params)
    @round.user = current_user

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

  # PATCH/PUT /rounds/1
  # PATCH/PUT /rounds/1.json
  def update
    respond_to do |format|
      if @round.update(round_params)
        format.html { redirect_to @round, notice: 'Round was successfully updated.' }
        format.json { render :show, status: :ok, location: @round }
      else
        format.html { render :edit }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rounds/1
  # DELETE /rounds/1.json
  def destroy
    @round.destroy
    respond_to do |format|
      format.html { redirect_to rounds_url, notice: 'Round was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round
      @round = Round.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def round_params
      params.require(:round).permit(:theme_id, :user_id, :current_answers, :wrong_answers, :finished)
    end
end
