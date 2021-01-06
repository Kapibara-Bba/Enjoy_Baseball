class TeamsController < ApplicationController
  before_action :authenticate_user!

  def new
    @teams = Team.all
    @team = Team.new
  end

  def show
    @team_users = User.where(team_id: params[:id])
    @team = Team.find(params[:id])
    @users = User.all
    @info = Info.new
    @info.build_spot
    @infos = @team.infos
    @team_record = TeamRecord.all
    @team_records = @team.team_records
    @team_record_new = TeamRecord.new(team_record_params)
  end

  def room
    @user = User.where(user_id: params[:id])
    @team_users = User.where(team_id: params[:team_id])
    @team = Team.find(params[:team_id])
    @post_comment = PostComment.new
    @post_comments = @team.post_comments
    # 通知機能
    @notifications = current_user.passive_notifications
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def create
    @teams = Team.all
    @user = current_user
    params[:team][:team]
    if params[:team][:team] == '0'
      # byebug
      if params[:team][:id].present?
        @team = Team.find(params[:team][:id])
        if @user.update!(team_id: @team.id)
            redirect_to team_path(@team)
        end
      else
        @team = Team.new
        @team.errors.add(:id, 'チームを選択してください')
        render 'new'
      end
    else
      @team = Team.new(team_params)
      # byebug
      if @team.save
         @user.update!(team_id: @team.id)
         redirect_to team_path(@team)
         flash[:notice] = "チームの作成に成功しました"
      else
        @teams = Team.all
        @team = Team.new
        @team.errors.add(:id, 'チームを選択してください')
        render 'new'
      end
    end
  end

  def edit
    @team = Team.find(params[:id])
    if @team.id != current_user.team_id
      redirect_to team_path(current_user.team_id)
    end
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      # @user.team_id = current_user.team_id
      redirect_to team_path(@team)
      flash[:notice] = "チームプロフィールの変更に成功しました"
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
  def team_params
    params.require(:team).permit(:teamname, :prefecture_code, :city, :team_image)
  end

  def team_record_params
    params.permit(:team_id, :days, :opponent, :result, :team_score, :rival_score, :battery, :homerun)
  end

end

