class TeamsController < ApplicationController

  def top
    @teams = Team.all
    @team = Team.new
  end

  def index
    @user = User.all
    # @team = current_user.team
  end

  def show
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
  def params_team
    params.require(:team).permit(:teamname, :prefecture_code, :city)
  end

end
