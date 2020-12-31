class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.where(user_id: params[:id])
    @team_users = User.where(team_id: params[:team_id])
    @team = User.find(params[:team_id])
    @post_comment = PostComment.new
    @post_comments = @team.post_comments
    # @post = Post.where(team_id: params[:team_id])
    # @posts = Post.where(team_id: params[:team_id])
    # @post = Post.new
    # @image_url = "https://msy-eb-resize.s3-ap-northeast-1.amazonaws.com/store/" + @post.image_id + "-thumbnail."
  end

  # def create
  #   # @team = Post.where(team_id: params[:team_id])
  #   @posts = Post.where(team_id: params[:team_id])
  #   @post = current_user.posts.new(post_params)
  #   @post.team_id = current_user.team_id
  #   @post.user_id = current_user.id
  #   @post.save

  #   # if @post.save
  #   # redirect_to team_posts_path(@post.team_id)
  #   # else
  #   #   render 'index'
  #   # end
  # end

  # def destroy
  #   @post = Post.find(params[:id])
  #   # @book_comment = current_user.posts.find_by(book_id: @book.id)
  #   @post.destroy
  #   # redirect_to team_posts_path
  # end

  # private
  # def post_params
  #   params.require(:post).permit(:comment, :image)
  # end

end
