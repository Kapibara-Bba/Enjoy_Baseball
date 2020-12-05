class RecordsController < ApplicationController

  def batter_index
    search_column = record_params[:search_column]
    if search_column.nil?
      search_column = "batting"
    end
    calculate_method = "sum(records.#{search_column})"
    calculate_method = "sum(records.hit)/sum(records.batting)" if search_column == 'average'
    calculate_method = "(sum(records.hit)+sum(records.ball))/(sum(records.batting)+sum(records.ball)+sum(records.sacrifice_fly))" if search_column == 'base'
    # 配列を作る
    sum_columns = [
      "batting","hit","homerun","two_base_hit","three_base_hit","dot","homein",
      "strike_out","ball","bunt","sacrifice_fly","still","error"
    ].map { |c| "sum(records.#{c}) as sum_#{c}"}.join(",")

    @users = User.joins(:records).group("records.user_id").select("users.*, records.*, #{sum_columns}, #{calculate_method}").order("#{calculate_method} DESC")
  　
    @records = Record.all
  end

  def pitch_index
    search_column = record_params[:search_column]
    if search_column.nil?
      search_column = "win"
    end
    calculate_method = "sum(records.#{search_column})"
    calculate_method = "(records.earned_run*9/records.inning)" if search_column == 'earned_run_average'
    calculate_method = "(records.win/(records.win+records.lose))" if search_column == 'win_rate'
    # 配列を作る
    sum_columns = [
      "inning","win","lose","to_be_point","earned_run","to_be_strike_out",
      "to_be_hit","to_be_homerun","to_be_ball"
    ].map { |c| "sum(records.#{c}) as sum_#{c}"}.join(",")

    @users = User.joins(:records).group("records.user_id").select("users.*, records.*, #{sum_columns}, #{calculate_method}").order("#{calculate_method} DESC")
    #@users = @user.records
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
    #binding.pry
    if @record.save!
      redirect_to user_path(current_user)
    else
      @records = Record.all
      @user_record = current_user.records
      render 'users#show'
    end
  end


  private
  def record_params
    params.permit(:bat, :batting, :hit, :two_base_hit, :three_base_hit, :homerun, :strike_out, :ball, :bunt, :dot, :homein,
     :sacrifice_fly, :still, :error, :game, :pitch_game, :win, :lose, :inning, :to_be_hit, :to_be_homerun, :to_be_strike_out, :to_be_ball,
     :to_be_point, :earned_run, :days, :search_column)
  end
end
