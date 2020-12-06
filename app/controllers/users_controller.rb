class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    # @user_team = current_user.team
  end

  def show
    @user = User.find(params[:id])
    @team = Team.find_by(user_id: params[:id])
    @records = Record.all
    @user_record = @user.records
    @record = Record.new
  end

  def edit
    @user = User.find(params[:id])
    @teams = Team.all
    # if @user.id != current_user.id
    #   redirect_to user_path(current_user)
    # end
  end

  def update
   @user = User.find(params[:id])
    if @user.update(user_params)
      @user.team_id = current_user.team_id
      flash[:user_update] = "プロフィールの変更に成功しました"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    current_user.destroy
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to :root #削除に成功すればrootページに戻る
  end


  private
  def user_params
    params.require(:user).permit(:name, :image, :team_id, :position, :throw)
  end
end
