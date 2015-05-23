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
      apply_tags(params[:tags])
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
    if @question.destroy
      redirect_to questions_path
    else
      flash[:warn] = "Quesiton was not deleted."
      redirect_to :back
    end
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

  def apply_tags(tag_string)
    tags = tag_string.split(',').collect(&:strip)
    tags.each { |tag| @question.tags.find_or_create_by(name: tag) }
  end
end