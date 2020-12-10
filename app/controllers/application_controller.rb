class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

   def after_sign_in_path_for(resource)
      if current_user.team_id  == nil
        new_team_path
      else
        flash[:notice] = "ログインしました"
        team_path(current_user.team_id)
      end
   end

   def after_sign_out_path_for(resource)
     flash[:notice] = "ログアウトしました"
     root_path
   end

  #ログインしているユーザーかどうか
#   def correct_user
#      @user = User.find(params[:id])
#      unless @user.id == current_user.id
#       redirect_to team_records_path
#      end
#   end

   #ログインしているユーザーが所属しているチームかどうか
#   def correct_team
#      @team = Team.find(params[:id])
#      unless  @team.id == current_user.team_id
#       redirect_to team_records_path
#      end
#   end

   #ユーザーとチームのinfoが一致しているか
#   def correct_info
#      @info = Info.find(params[:id])
#      unless @info.team_id == current_user.team_id
#       redirect_to team_records_path
#      end
#   end

   protected
     def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])    #許可する項目を記入する
     end

end
