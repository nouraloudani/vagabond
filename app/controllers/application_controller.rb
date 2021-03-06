class ApplicationController < ActionController::Base
    before_action :authorized?
    skip_before_action :authorized?, only: :logo

    def find_current_user
      @current_user = User.find_by(id: session[:user_id])
    end 
  
    def authorized? 
      # code unless condition
      redirect_to new_session_path unless find_current_user
    end 

   def logo
    send_file "app/assets/images/logo.png" , type: 'image/png', disposition: 'inline'
   end
   
end
