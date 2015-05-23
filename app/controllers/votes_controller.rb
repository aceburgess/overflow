class VotesController < ApplicationController

  def create
    @vote = Vote.new(vote_params)
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
  	params.require(:vote).permit(:is_upvote, :votable_id, :votable_type).merge(user_id: current_user.id)
  end

end
