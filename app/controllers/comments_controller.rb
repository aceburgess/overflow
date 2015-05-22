class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
  	@comment = Comment.new(todo_params)
    if @comment.save
      redirect_to :back
  	else
  	  flash[:warn] = "Your comment couldn't be saved"
  	end
  end

  def edit
  end

  def update
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

  def find_comment
  	@comment = Comment.find(params[:id])
  end

  def comment_params
  	params.require(:comment).permit(:commentable_id, :commentable_type, :content, :user_id)
  end

end