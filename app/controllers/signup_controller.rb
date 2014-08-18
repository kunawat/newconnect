class SignupController < ApplicationController
	before_filter :check
 	
   
	   def create_new_user
  			hash = params[:user]
  			if(hash[:username] == "" || hash[:first_name] == "" || hash[:last_name] == "" || hash[:password] == "" || hash[:email] == "")
  				flash[:msg] = "Please fill all the fileds"
  				redirect_to(:controller => "signup", :action => 'signup_page')
  			else
  				@new_user = User.new(hash)
          if(@new_user.save)
          session[:user_id] = @new_user.id
  				redirect_to(:controller => "home", :action => 'home_page')
          else
            flash[:msg] = "Username or emailId  already taken"
            redirect_to(:controller => "signup", :action => 'signup_page')
          end
  			end
   	end	

    private
   	def check
   		if(session[:user_id] == nil)
    		redirect_to(:controller => "connect", :action => 'login_page')
    	
    	end
   	
   	end
end

