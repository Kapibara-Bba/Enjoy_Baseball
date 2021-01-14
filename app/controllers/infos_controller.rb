class InfosController < ApplicationController
  before_action :authenticate_user!

  def new
    @info = Info.new
    @info.build_spot
  end

  def create
    @info = Info.new(info_params)
    @info.team_id = current_user.team_id
    @team = current_user.team
    @infos = @team.infos
    @info.save
    # 非同期通信
    # if @info.save
    #   redirect_to team_path(@info.team_id)
    #   flash[:info_create] = "イベントを追加しました"
    # else
    #   render 'new'
    # end
  end

  def show
    @info = Info.find(params[:id])
    @lat = (@info.spot.nil?)? nil :  @info.spot.latitude #nilの場合は
    @lng = (@info.spot.nil?)? nil :  @info.spot.longitude
    gon.lat = @lat
    gon.lng = @lng
  end

  def edit
    @info = Info.find(params[:id])
    @lat = (@info.spot.nil?)? nil :  @info.spot.latitude #nilの場合は
    @lng = (@info.spot.nil?)? nil :  @info.spot.longitude
    gon.lat = @lat
    gon.lng = @lng
    if @info.team_id != current_user.team_id
      redirect_to team_records_path
    end
  end

  def update
    @info = Info.find(params[:id])
    @info.team_id = current_user.team_id
    if @info.update(info_params)
      redirect_to team_path(@info.team_id)
      flash[:info_update] = "イベント内容を変更しました"
    else
      render 'edit'
    end
  end

  def destroy
    @info = Info.find(params[:id])
    @info.destroy
    redirect_to team_path(current_user.team_id)
  end

  private
  def info_params
    params.require(:info).permit(:body, :start_time, :location, spot_attributes: [:address])
  end

end
