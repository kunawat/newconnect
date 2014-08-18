class HomeController < ApplicationController


before_filter :check
 	
def sign_out
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
