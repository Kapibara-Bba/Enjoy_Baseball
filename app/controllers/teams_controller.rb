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
    @team = Team.new(team_params)
    if params[:team][:team] == '0'
      redirect_to users_path
    else
      @team.save
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
