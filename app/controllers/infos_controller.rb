class InfosController < ApplicationController
  before_action :authenticate_user!

  def new
    @info = Info.new
  end

  def create
    # @team = Team.find(params[:id])
    @info = Info.new(create_info_params)
    @infos = Info.all
    @info.team_id = current_user.team_id
    if @info.save
      redirect_to team_path(@info.team_id)
      flash[:info_create] = "イベントを追加しました"
    else
      render 'users#show'
    end
  end

  def show
    @info = Info.find(params[:id])
  end

  def map
    results = Geocoder.search(params[:location])
    @latlng = results.first.coordinates
    respond_to do |format|
    format.js
    end
  end

  def edit
    @info = Info.find(params[:id])
  end

  def update
    @info = Info.find(params[:id])
    @info.team_id = current_user.team_id
    if @info.update(update_info_params)
      redirect_to team_path(@info.team_id)
      flash[:info_update] = "イベント内容を変更しました"
    else
      render 'users#edit'
    end
  end

  private
  def create_info_params
    params.permit(:team_id, :body, :start_time, :location)
  end
  def update_info_params
    params.require(:info).permit(:team_id, :body, :start_time, :location)
  end
end
