class InfosController < ApplicationController

  def new
    @info = Info.new
  end

  def create
    @team = Team.find(params[:id])
    @info = Info.new(info_params)
    @infos = Info.all
    @info.team_id = current_user.team_id
    if @info.save
      redirect_to team_path(@info.team_id)
    else
      render 'user#show'
    end
  end

  def edit
  end

  def update
  end

  private
  def info_params
    params.permit(:team_id, :body, :start_time)
  end
end
