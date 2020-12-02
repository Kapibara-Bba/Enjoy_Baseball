class TeamRecordsController < ApplicationController

  def show
    @team = Team.find(params[:id])
    @team_records = @team.team_records
  end

  def create
    @team_record = TeamRecord.new(team_record_params)
    @team_record.team_id = current_user.team_id
    if @team_record.save
      redirect_to team_record_path(current_user.team_id)
    else
      render 'users#show'
    end
  end

  def mark
    @team = Team.find(params[:id])
    @team_record = TeamRecord.find(params[:id])
  end

  def edit
  end

  def update
  end



  private
  def team_record_params
    params.permit(:team_id, :days, :opponent, :result, :team_score, :rival_score)
  end
end
