class CommentsController < ApplicationController
  before_action :find_movie
  before_action :find_comment, only: [:edit, :destroy]

  # def index
  #   @comments = Comment.all
  # end

  # def edit
  # end

  def create
    # @comment = Comment.new(comment_params)
    @comment = @movie.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to movie_path(@movie), notice: "Your comment was successfully created!"
    else
      redirect_to movie_path(@movie), notice: "Your comment has not been created!"
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
    params.require(:comment).permit(:description, :movie_id, :user_id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end
end
