class PostsController < ApplicationController

  def index
    @posts = Post.all
    @post = Post.new
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
    params.permit(:image, :comment)
  end

end
