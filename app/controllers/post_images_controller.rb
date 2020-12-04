class PostImagesController < ApplicationController

  def create
    @post_images = PostImage.all
    @post_image = current_user.post_images.new(post_image_params)
    @post_image.team_id = current_user.team_id
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to team_posts_path(current_user.team_id)
    else
      render  'posts#index'
    end
  end

  def destroy
  end

  private
  def post_image_params
    params.require(:post_image).permit(:image)
  end

end
