class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @user_record = @user.records
    @record = Record.new
  end

  def edit
    @user = User.find(params[:id])
    @teams = Team.all
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  def update
   @user = User.find(params[:id])
    if @user.update(user_params)
      @user.team_id = current_user.team_id
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    current_user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to :root #削除に成功すればrootページに戻る
  end

  private
  def user_params
    params.require(:user).permit(:name, :image, :team_id, :position, :throw)
  end
end
