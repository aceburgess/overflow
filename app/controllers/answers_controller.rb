class AnswersController < ApplicationController
  before_action :get_answer, only: [:edit, :update, :destroy]
  before_action :get_question, only: [:create]

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to question_path(@question)
    else
      flash[:warn] = "Sorry that answer was not created. Please try again."
      redirect_to :back
    end
  end


  def update
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to question_path(@question)
    else
      flash[:warn] = "Sorry that answer was not updated. Please try again."
      redirect_to :back
    end
  end

  def destroy
    if @answer.destroy
      redirect_to :root
    else
      flash[:warn] = "Sorry that answer was not deleted. Please try again."
      redirect_to :back
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content).merge(user_id: current_user.id, question_id: params[:question_id])
  end

  def get_question
    @question = Question.find_by(id: params[:question_id])
  end

  def get_answer
    @answer = Answer.find_by(id: params[:id])
  end

end
