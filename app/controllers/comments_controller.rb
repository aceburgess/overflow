class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    if params[:answer_id]
      @commentable_object = Answer.find_by(id: params[:answer_id])
    elsif params[:question_id]
      @commentable_object = Question.find_by(id: params[:question_id])
    end
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      case @coment.commentable_type
      when "Answer" then redirect_to answer_path(id: @comment.commentable_id)
      when "Question" then redirect_to question_path(id: @comment.commentable_id)
      end
  	else
  	  flash[:warn] = "Your comment couldn't be saved"
      redirect_to :back
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
  	params.require(:comment).permit(:content, :commentable_type, :commentable_id).merge(user_id: current_user.id)
  end

end
