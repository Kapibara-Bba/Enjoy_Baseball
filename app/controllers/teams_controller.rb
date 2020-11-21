class TeamsController < ApplicationController

  def teamselect
    @teams = Team.all
    @team = Team.new
  end

  def index
    @user = User.all
    # @team = current_user.team
  end

  def show
    @team = Team.find(params[:id])
    @user = User.find(params[:id])
    @users = User.all
    
  end

  def create
    @team = Team.new(team_params)
    @team.save
    redirect_to team_path(current_user)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def team_params
    params.require(:team).permit(:teamname, :prefecture_code, :city)
  end

end
