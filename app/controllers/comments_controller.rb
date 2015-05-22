class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    if params[:question_id]
      parent = Question.find(params[:question_id])
    else
      parent = Answer.find(params[:answer_id])
    end

  	new_comment = parent.comments.build(comment_params)

    if new_comment.save
      redirect_to :back
  	else
  	  flash[:warn] = "Your comment couldn't be saved"
  	end
  end

  def edit
  end

  def update
    @comment = Comment.find(params[:id])
  	if @comment.update_attributes(comment_params)
  	  redirect_to :back
  	else
  	  flash[:warn] = 'Was not able to save this comment'
  	end
  end

  def destroy
  	flash[:message] = 'Comment deleted' if @comment.delete
  end

  private

  def comment_params
  	params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end

end
