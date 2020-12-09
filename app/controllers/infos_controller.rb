class InfosController < ApplicationController
  before_action :authenticate_user!

  def create
    # @team = Team.find(params[:id])
    @info = Info.new(create_info_params)
    # @infos = Info.all
    @info.team_id = current_user.team_id
    if @info.save
      redirect_to team_path(@info.team_id)
      flash[:info_create] = "イベントを追加しました"
    else
      render 'users#show'
    end
    # # google map
    # @review = Review.new(review_params)
    # if @map.save
    #   redirect_to root_path
    # else
    #   redirect_to new_review_path
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
    if @info.team_id != current_user.team_id
      redirect_to team_records_path
    end
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
    params.require(:info).permit(:body, :start_time, :location, spot_attributes: [:address])
  end

  def update_info_params
    params.require(:info).permit(:body, :start_time, :location, spot_attributes: [:address])
  end

end
