class InfosController < ApplicationController

  def new
    @info = Info.new
  end

  def create
    # @team = Team.find(params[:id])
    @info = Info.new(info_params)
    @infos = Info.all
    @info.team_id = current_user.team_id
    if @info.save
      redirect_to team_path(@info.team_id)
    else
      render 'users#show'
    end
  end

  def show
    @info = Info.find(params[:id])

  end

  def edit
    @info = Info.find(params[:id])
  end

  def update
    @info = Info.find(params[:id])
    @info.team_id = current_user.team_id
    if @info.update(info_params)
      flash[:update] = "You have updated book successfully."
      redirect_to team_path(@info.team_id)
    else
      render 'users#edit'
    end
  end

  private
  def info_params
    params.require(:info).permit(:team_id, :body, :start_time, :location)
  end
end
