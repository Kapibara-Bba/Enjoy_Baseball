class TeamsController < ApplicationController

  def new
    @teams = Team.all
    @team = Team.new

  end

  def index
    @user = User.all
    # @team = current_user.team
  end

  def show
    #@user = User.find(params[:id])
    @team = Team.find(params[:id])
    @users = User.all
    @user_team = @user
  end

  def create
    if params[:team][:team] == '0'
      @team_id = Team.find(params[:team][:id])
      redirect_to team_path(@team_id.id)
    else
      @team = Team.new(team_params)
      @team.save
      # byebug
      redirect_to team_path(current_user)
    end
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
