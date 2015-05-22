class TagsController < ApplicationController
  def index
  
  end

  def new

  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      question = tag_params[:question_id]
      redirect_to question_path
    else
      redirect_to '/error'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to '/'
  end


  private

  def tag_params
    params.require(:tag).permit(:name, :question_id)
  end

end