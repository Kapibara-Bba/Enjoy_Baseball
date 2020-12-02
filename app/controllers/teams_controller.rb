class TeamsController < ApplicationController

  def new
    @teams = Team.all
    @team = Team.new

  end


  def show
    @infos = Info.all
    @team_users = User.where(team_id: params[:id])
    @team = Team.find(params[:id])
    @users = User.all
    @team_record = TeamRecord.find(params[:id])
    @team_records = @team.team_records
  end

  def create
    @user = current_user
    if params[:team][:team] == '0'
      #byebug
      @team = Team.find(params[:team][:id])
      @user.update!(team_id: @team.id)
      redirect_to team_path(@team)
    else
      @team = Team.new(team_params)
      @team.save
      @user = current_user
      @user.update!(team_id: @team.id)
      redirect_to team_path(@team)
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
