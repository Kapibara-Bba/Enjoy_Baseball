class UsersController < ApplicationController

  def index
    @users = User.all
    # @team = Team.find(params[:id])
    # @user_team = current_user.team
  end

  def show
    @user = User.find(params[:id])
    @records = Record.all
    @user_record = @user.records
    @record = Record.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :profile_image_id, :team_id, :position, :throw)
  end
end
