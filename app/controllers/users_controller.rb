class UsersController < ApplicationController

  def index
    @users = User.all
    # @team = Team.find(params[:id])
    # @user_team = current_user.team
  end

  def show
    @user = User.find(params[:id])
    @records = Record.find(params[:id])
    @user_record = @user.records
    @record = Record.new
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:username, :profile_image_id)
  end
end
