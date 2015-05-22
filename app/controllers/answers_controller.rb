class AnswersController < ApplicationController
  def index
  end

  def new
    @answer = Answer.new
    @question = Question.find_by
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      question = answer_params[:question_id]
      redirect_to question_path
    else
      redirect_to '/error'
    end
  end


  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.new(answer_params)
    if @answer.save
      question = answer_params[:question_id]
      redirect_to question_path
    else
      redirect_to '/error'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to '/'
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :user_id, :question_id)
  end

end
