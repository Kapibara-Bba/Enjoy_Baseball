class RecordsController < ApplicationController

  def batter_index
    @user = User.all
    @records = Record.all
  end

  def pitch_index
    @user = User.all
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    # @user = User.find(params[:id])
    # Record.create(record_params)
    @record = Record.new(record_params)
    @record.user_id = current_user.id
    if @record.save
      redirect_to records_batter_path
    else
      redirect_to root_path
    end
  end

  private
  def record_params
    params.permit(:bat, :batting, :hit, :two_base_hit, :three_base_hit, :homerun, :strike_out, :ball, :bunt, :dot, :homein,
     :sacrifice_fly, :still, :error, :game, :pitch_game, :win, :lose, :inning, :to_be_hit, :to_be_homerun, :to_be_strike_out, :to_be_ball,
     :to_be_point, :earned_run, :days)
  end
end
