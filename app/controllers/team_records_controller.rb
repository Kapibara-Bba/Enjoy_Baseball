class TeamRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @teams = Team.all
    @team_records = TeamRecord.all
    @q = TeamRecord.ransack(params[:q])
    @team_records = @q.result
  end

  def show
    @team_record = TeamRecord.find(params[:id])

  end

  def create
    @team_record = TeamRecord.new(create_team_record_params)
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
    @team_record = TeamRecord.find(params[:id])
    @team_record.team_id = current_user.team_id
    if @team_record.update(update_team_record_params)
      flash[:user_update] = "試合結果を変更しました"
      redirect_to team_record_path(@team_record)
    else
      render 'edit'
    end
  end

  def destroy
    @team_record = TeamRecord.find(params[:id])
    @team_record.destroy
    redirect_to team_path(current_user.team_id)
  end

  private
    def create_team_record_params
      params.permit(:team_id, :days, :opponent, :team_score, :rival_score, :result, :battery, :homerun)
    end

    def update_team_record_params
      params.require(:team_record).permit(:team_id, :days, :opponent, :team_score, :rival_score, :result, :battery, :homerun)
    end

end
