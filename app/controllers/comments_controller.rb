class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment, notice: "Your comment was successfully created!"
    else
      render 'new'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: "Your comment was successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to movies_path, notice: "Your comment was successfully deleted!"
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :user_id, :movie_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
