class RecordsController < ApplicationController

  def batter_index
    @search_column = params[:search_column]
    if @search_column.nil?
      @search_column = "batting"
    end
    @records = Record.all
    @users = User.joins(:records).group(:id).select('user_id, users.name, users.image_id, users.team_id,
                                            SUM(hit) * 10000 / SUM(batting) AS average,
                                            (SUM(hit) * 10000 + SUM(ball)) / (SUM(batting) + SUM(ball) + SUM(sacrifice_fly)) AS base,
                                            SUM(homerun) AS homerun,
                                            SUM(batting) AS batting,
                                            SUM(hit) AS hit,
                                            SUM(two_base_hit) AS two_base_hit,
                                            SUM(three_base_hit) AS three_base_hit,
                                            SUM(dot) AS dot,
                                            SUM(homein) AS homein,
                                            SUM(strike_out) AS strike_out,
                                            SUM(ball) AS ball,
                                            SUM(bunt) AS bunt,
                                            SUM(sacrifice_fly) AS sacrifice_fly,
                                            SUM(still) AS still,
                                            SUM(error) AS error
                                            ').order("#{@search_column} DESC").limit(50)

  end

  def pitch_index
    @search_column = params[:search_column]
    if @search_column.nil?
      @search_column = "win"
    end
    @records = Record.all
    @users = User.joins(:records).group(:id).select('user_id, users.name, users.image_id, users.team_id,
                                            SUM(earned_run) * 9 * 10000/ SUM(inning) AS earned_run_average,
                                            SUM(win) * 10000 / (SUM(win) + SUM(lose)) AS win_rate,
                                            SUM(inning) AS inning,
                                            SUM(win) AS win,
                                            SUM(lose) AS lose,
                                            SUM(to_be_point) AS to_be_point,
                                            SUM(earned_run) AS earned_run,
                                            SUM(to_be_strike_out) AS to_be_strike_out,
                                            SUM(to_be_hit) AS to_be_hit,
                                            SUM(to_be_homerun) AS to_be_homerun,
                                            SUM(to_be_ball) AS to_be_ball
                                            ').order("#{@search_column} DESC").limit(50)

  end

  def create
  # 非同期通信
    @record = Record.new(record_params)
    @record.user_id = current_user.id
    @user_record = current_user.records
    #byebug
    @record.save
    # 非同期でない場合
    # if @record.save
    #   redirect_to user_path(current_user)
    #   flash[:notice] = "記録の作成に成功しました"
    # elses
    #   @records = Record.all
    #   @user_record = current_user.records
    #   render 'users#show'
    # end
  end

  def show
    @record = Record.find(params[:id])
    @user = @record.user
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    @record.user_id = current_user.id
    if @record.update(record_params)
      redirect_to record_path(@record)
    else
      render 'edit'
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to user_path(current_user)
  end

  private

  def record_params
    params.require(:record).permit(:bat, :batting, :hit, :two_base_hit, :three_base_hit, :homerun, :strike_out, :ball, :bunt, :dot, :homein,
     :sacrifice_fly, :still, :error, :game, :pitch_game, :win, :lose, :inning, :to_be_hit, :to_be_homerun, :to_be_strike_out, :to_be_ball,
     :to_be_point, :earned_run, :days, :opponent, :team_score, :rival_score, :search_column, :memo)
  end
end
