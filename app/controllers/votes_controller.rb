class VotesController < ApplicationController

  def create
    @vote = Vote.new(vote_params)
  	# if params[:question_id]
   #    parent = Question.find(params[:question_id])
   #  else
   #    parent = Answer.find(params[:answer_id])
   #  end
	  # new_vote = parent.votes.build(vote_params)
    binding.pry
    if @vote.save
      redirect_to :back
    else
      flash[:warn] = "Something went wrong"
      redirect_to :back
    end
  end

  def update
    @vote = Vote.find(params[:id])
    if params[:vote]
      @vote.update_attributes(vote_params)
      redirect_to :back
    else
      flash[:warn] = 'Something went wrong'
    end
  end

  private

  def vote_params
  	params.require(:vote).permit(:is_upvote).merge(user_id: current_user.id, votable_id: params[:votable_id], votable_type: params[:votable_type])
  end

end
