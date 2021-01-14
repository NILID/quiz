class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_question, only: [:show, :edit, :update, :destroy, :check]
  after_action :verify_authorized

  def index
    @questions = Question.all
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
    redirect_to @question, notice: 'Question was successfully checked.'
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
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @question
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @question

    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, answers_attributes: [:id, :title, :correct])
    end
end
