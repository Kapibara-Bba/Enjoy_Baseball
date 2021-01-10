class TeamRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @teams = Team.all
    @team_records = TeamRecord.page(params[:page]).reverse_order
    @q = TeamRecord.ransack(params[:q])
    @team_records = @q.result.page(params[:page]).reverse_order
  end

  def show
    #@team = Team.find(params[:id])
    @team_record = TeamRecord.find(params[:id])
  end

  def create
    # 非同期通信
    @team = current_user.team
    @team_record = TeamRecord.new(create_team_record_params)
    @team_record.team_id = current_user.team_id
    #byebug
    @team_records = @team.team_records
    @team_record.save
    # 非同期でない場合
    # if @team_record.save
    #   redirect_to team_path(current_user.team_id)
    #   flash[:team_record_create] = "試合結果を作成しました"
    # else
    #   render 'users#show'
    # end
  end

  def update
    # 非同期通信
    @team_record = TeamRecord.find(params[:id])
    @team_record.team_id = current_user.team_id
    @team_record.update(update_team_record_params)
    # 非同期通信でない時
    # if @team_record.update(update_team_record_params)
    #   flash[:team_record_update] = "試合結果を変更しました"
    #   redirect_to team_record_path(@team_record)
    # else
    #   render 'show'
    # end
  end

  def destroy
    @team_record = TeamRecord.find(params[:id])
    @team_record.destroy
    redirect_to team_path(current_user.team_id)
  end

  private
    def create_team_record_params
      params.require(:team_record).permit(:team_id, :days, :opponent, :team_score, :rival_score, :result, :battery, :homerun)
    end

    def update_team_record_params
      params.require(:team_record).permit(:team_id, :days, :opponent, :team_score, :rival_score, :result, :battery, :homerun)
    end

end
