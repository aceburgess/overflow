class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    # binding.pry
    if params[:answer_id]
      @commentable_object = Answer.find_by(id: params[:answer_id])
    elsif params[:question_id]
      @commentable_object = Question.find_by(id: params[:question_id])
    end
    if request.xhr?
      respond_to do |format|
        format.html { render partial: 'form', locals: {commentable_object: @commentable_object} }
      end
    end
  end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        case @comment.commentable_type
        when "Answer" then
          if request.xhr?
            format.html { render @comment }
          else
            redirect_to question_path(id: Answer.find_by(id: @comment.commentable_id).question_id)
          end
        when "Question" then
          if request.xhr?
            format.html { render @comment }
          else
            redirect_to question_path(id: @comment.commentable_id)
          end
        end
    	else
    	  flash[:warn] = "Your comment couldn't be saved"
        redirect_to :back
    	end
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
  	params.require(:comment).permit(:content).merge(user_id: current_user.id, commentable_type: params[:commentable_type], commentable_id: params[:commentable_id])
  end

end
