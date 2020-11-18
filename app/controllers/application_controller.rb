class ApplicationController < ActionController::Base
  
   def after_sign_in_path_for(resource)
     users_path(resource)
   end

   def after_sign_up_path_for
     teamselect_path
   end
end
