class QuestionsController < ApplicationController
  before_action :get_questions, only: [:index]
  before_action :get_question, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      flash[:warn] = "Question was not saved. Please try again."
      redirect_to :back
    end
  end

  def edit
  end

  def update
    if Question.update_attributes(question_params)
      redirect_to question_path @question
    else
      flash[:warn] = "Question was not updated. Please try again"
      redirect_to :back
    end
  end

  def destroy
    @question.destroy
  end

  private
  def get_questions
    @questions = Question.all
  end

  def get_question
    @question = Question.find_by(id: params[:id])
  end

  def question_params
    params.require(:question).permit(:title,:content,:is_answered,:chosen_answer_id).merge(user_id: current_user.id)
  end
end