class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    # @team = Team.find(user_id: params[:id])
    # @records = Record.all
    @user_record = @user.records
    @record = Record.new
    @image_url = "https://msy-eb-resize.s3-ap-northeast-1.amazonaws.com/store/" + @user.image_id + "-thumbnail."
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
      # flash[:notice] = "プロフィールの変更に成功しました"
      # redirect_to user_path(@user)
      sleep(3) # S3への画像反映のタイムラグを考慮して3秒待機
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
