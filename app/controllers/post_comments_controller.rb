class PostCommentsController < ApplicationController

  def create
    # 非同期通信
    @team = Team.find(params[:team_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.team_id = @team.id
    @post_comment.save
    # 非同期通信でない時
    # if @post_comment.save!
    #   redirect_to team_teams_room_path(@team)
    # else
    #   render 'teams/room'
    # end
  end

  def destroy
    # 非同期通信
    @team = Team.find(params[:team_id])
    @post_comment = @team.post_comments.find(params[:id])
    @post_comment.destroy
    # 非同期通信でない時
    # redirect_to team_teams_room_path(@team)
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment, :image)
  end
end
