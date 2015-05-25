class VotesController < ApplicationController

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      respond_to do |format|
      if request.xhr?
        format.json { render :json => @vote.votable.total_votes, :status => 200 }
      else
        redirect_to question_path(@vote.votable)
      end
    end
    else
      flash[:warn] = "Something went wrong"
    end
  end

  private

  def vote_params
  	params.require(:vote).permit(:is_upvote, :votable_id, :votable_type).merge(user_id: current_user.id)
  end

end
