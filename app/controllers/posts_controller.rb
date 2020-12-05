class PostsController < ApplicationController

  def index
    @users = User.all
    @team_users = User.where(team_id: params[:team_id])
    #@team = Team.find(params[:id])
    #@team_post = @team.posts
    @posts = Post.all
    @post = Post.new

  end

  def create
    @post = current_user.posts.new(post_params)
    @post.team_id = current_user.team_id
    @post.user_id = current_user.id
    if @post.save
      redirect_to team_posts_path(@post.team_id)
    else
      render 'index'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    # @book_comment = current_user.posts.find_by(book_id: @book.id)
    @post.destroy
    redirect_to post_path(current_user.team_id)
  end

  private
  def post_params
    params.require(:post).permit(:comment, :image)
  end

end
