class HomeController < ApplicationController


before_filter :check
 	
def sign_out
		user = User.find_by_id(session[:user_id])
		user.online = false
		user.save
		session[:user_id] = nil
		redirect_to(:controller => "connect", :action => 'login_page')		
end
def home_page
		@users=User.all
		if(session[:user_id]== nil)
			redirect_to(:controller => "connect", :action => 'login_page')
		end	
	end



   private
	
	
	
		

	def check
   		if(session[:user_id] == nil)
    		redirect_to(:controller => "connect", :action => 'login_page')
    	
      
    	end
   	
   	end
end
