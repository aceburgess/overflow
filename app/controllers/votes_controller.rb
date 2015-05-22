class VotesController < ApplicationController

  def new
  	@parent = Question.find(params[:question_id]) if params[:question_id]
    @parent = Answer.find(params[:answer_id]) if params[:answer_id]
  	@vote = Vote.new
  end

  def create

  	if params[:question_id]
      parent = Question.find(params[:question_id])
    else
      parent = Answer.find(params[:answer_id])
    end

	new_vote = parent.votes.build(vote_params)

    if new_vote.save
        redirect_to :back
    else
      flash[:warn] = "Something went wrong"
    end
    
  end

  def edit
  end

  def update
  end

  private

  def vote_params
  	params.require(:vote).permit(:user_id, :votable_id, :votable_type, :is_upvote)
  end

end
