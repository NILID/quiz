class QuestionsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_question, only: [:show, :edit, :update, :destroy, :check]
  after_action :verify_authorized

  def index
    @pagy, @questions = pagy(Question.all.includes(:theme, :author))
    authorize @questions
  end

  def show
    authorize @question
  end

  def new
    @question = Question.new
    authorize @question
    4.times { @question.answers.build }
  end

  def check
    authorize @question
    @answer_id = params[:answer_id]
    @round = Round.find(params[:round_id])
    @result = @question.answers.where(correct: true).first.id.to_s == @answer_id
    @round.increment!(@result ? :current_answers : :wrong_answers)

    @round.results.create!( question_id: @question.id, answer_id: @answer_id, success: @result )
  end

  def edit
    authorize @question
  end

  def create
    @question = Question.new(question_params)
    authorize @question

    @question.author = current_user

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: t('flash.was_created', item: Question.model_name.human) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    authorize @question
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: t('flash.was_updated', item: Question.model_name.human) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @question

    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: t('flash.was_destroyed', item: Question.model_name.human)  }
    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :theme_id,  answers_attributes: [:id, :title, :correct])
    end
end
