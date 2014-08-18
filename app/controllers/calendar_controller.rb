class CalendarController < ApplicationController
	
	before_filter :check
 	
 	def show
    	@date = params[:date] ? Date.parse(params[:date]) : Date.today
    	@events_by_date = Event.all.group_by { |h| h.date } 
  	end
   private
	
	

   	def check
   		if(session[:user_id] == nil)
    		redirect_to(:controller => "connect", :action => 'login_page')
    	
      
    	end
   	
   	end
end
