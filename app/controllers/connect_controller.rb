class ConnectController < ApplicationController

	def logout
		session[:user_id]=nil;	
		redirect_to(:controller => "connect", :action => 'login_page')	
	end

	def login_attempt
		hash = params[:user]
		if (hash[:username] == "" && hash[:password] == "")
			flash[:msg] = "Please Enter Username and Password"
			redirect_to(:controller => "connect", :action => 'login_page')
		elsif (hash[:username] == "")
			flash[:msg] = "Please Enter Username"
			redirect_to(:controller => "connect", :action => 'login_page')
		elsif (hash[:password] == "")
			flash[:msg] = "Please Enter Password"
			redirect_to(:controller => "connect", :action => 'login_page')
		else
			user = AdminUser.authenticate_user(hash[:username], hash[:password])
			
			
			if(user)
				session[:user_id] =user.id
				if (user.username == "admin" )
				
					redirect_to(:controller => "signup", :action => 'signup_page')
				
				else
					user.online = true
					user.save
				    redirect_to(:controller => "home", :action => 'home_page')
				end

			else
				session[:user_id] = nil
				flash[:msg] = "Wrong username or password Please try again"
				redirect_to(:controller => "connect", :action => 'login_page')
			end 		
		end
	end
end
