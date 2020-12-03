class PostsController < ApplicationController
  
  def show
    @team = Team.find(params[:id])
    @posts = @team.posts
  end
  
  def create
    @post = Post.new(post_params)
    @post.team_id = current_user.team_id
    if @post.save
      redirect_to post_path(@post.team_id)
    else
      render :show
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to post_path(current_user.team_id)
  end
  
  private
  def post_params
    params.permit(:team_id, :image, :comment, :user_id)
  end
  
end
