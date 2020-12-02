class TeamRecordsController < ApplicationController

  def show
    @team_record = TeamRecord.find(params[:id])

  end

  def create
    @team_record = TeamRecord.new(team_record_params)
    @team_record.team_id = current_user.team_id
    if @team_record.save
      redirect_to team_path(current_user.team_id)
    else
      render 'users#show'
    end
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
