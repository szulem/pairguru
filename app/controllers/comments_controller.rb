class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_movie, only: [:create, :destroy]

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
      flash[:notice] = "Your comment was successfully created!"
      redirect_to movie_path(@movie)
    else
      flash[:danger] = "Your comment has not been created!"
      redirect_to movie_path(@movie)
    end
  end

  # def update
  #   if @comment.update(comment_params)
  #     redirect_to @comment, notice: "Your comment was successfully updated!"
  #   else
  #     render 'edit'
  #   end
  # end

  def destroy
    @comment = @movie.comments.find(params[:id])
    if @comment.destroy
      flash[:success] = "Your comment was successfully deleted!"
      redirect_to movie_path(@movie)
    else
      flash[:danger] = "Your comment has not been deleted!"
      redirect_to movie_path(@movie)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :movie_id, :user_id)
  end

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end
end
