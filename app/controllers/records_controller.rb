class RecordsController < ApplicationController

  def batter_index
    @user = User.all
    @records = Record.all
  end

  def pitch_index
    @user = User.all
    @records = Record.all
  end

  def create
    @user = User.find(params[:id])
    Record.create(record_params)
    Record.save
    redirect_to user_path(@user)
  end

  private
  def record_params
    params.require(:record).permit(:bat, :batting, :hit, :two_base_hit, :three_base_hit, :homerun, :strike_out, :ball, :bunt, :dot, :homein,
     :sacrifice_fly, :still, :error, :game, :pitch_game, :win, :lose, :inning, :to_be_hit, :to_be_homerun, :to_be_strike_out, :to_be_ball,
     :to_be_point, :earned_run)
  end
end
