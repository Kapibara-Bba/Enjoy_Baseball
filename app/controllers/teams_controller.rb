class TeamsController < ApplicationController
  
  def top
    @teams = Team.all
    @team = Team.new
  end

  def index
  end

  def show
  end

  def create
    @team = Team.new(team_params)
    @team.save
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
