class RecordsController < ApplicationController

  def batter_index
    search_column = record_params[:search_column]
    if search_column.nil?
      search_column = "batting"
    end
    # calculate_method = "sum(records.#{search_column})"
    # calculate_method = "sum(records.hit)/sum(records.batting)" if search_column == 'average'
    # calculate_method = "(sum(records.hit)+sum(records.ball))/(sum(records.batting)+sum(records.ball)+sum(records.sacrifice_fly))" if search_column == 'base'
    # # 配列を作る
    # sum_columns = [
    #   "batting","hit","homerun","two_base_hit","three_base_hit","dot","homein",
    #   "strike_out","ball","bunt","sacrifice_fly","still","error"
    # ].map { |c| "sum(records.#{c}) as sum_#{c}"}.join(",")

    # @users = User.joins(:records).group("records.user_id").select("users.*, records.*, #{sum_columns}, #{calculate_method}").order("#{calculate_method} DESC")
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
                                            ').order("#{search_column} DESC").limit(50)

  end

  def pitch_index
    search_column = record_params[:search_column]
    if search_column.nil?
      search_column = "win"
    end
    # calculate_method = "sum(records.#{search_column})"
    # calculate_method = "(records.earned_run*9/records.inning)" if search_column == 'earned_run_average'
    # calculate_method = "(records.win/(records.win+records.lose))" if search_column == 'win_rate'
    # # 配列を作る
    # sum_columns = [
    #   "inning","win","lose","to_be_point","earned_run","to_be_strike_out",
    #   "to_be_hit","to_be_homerun","to_be_ball"
    # ].map { |c| "sum(records.#{c}) as sum_#{c}"}.join(",")

    # @users = User.joins(:records).group("records.user_id").select("users.*, records.*, #{sum_columns}, #{calculate_method}").order("#{calculate_method} DESC")
    # #@users = @user.records
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
                                            ').order("#{search_column} DESC").limit(50)

  end

  def create
  # 非同期通信
    @record = Record.new(record_params)
    @record.user_id = current_user.id
    @user_record = current_user.records
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
  

  private
  def record_params
    params.permit(:bat, :batting, :hit, :two_base_hit, :three_base_hit, :homerun, :strike_out, :ball, :bunt, :dot, :homein,
     :sacrifice_fly, :still, :error, :game, :pitch_game, :win, :lose, :inning, :to_be_hit, :to_be_homerun, :to_be_strike_out, :to_be_ball,
     :to_be_point, :earned_run, :days, :search_column)
  end
end
