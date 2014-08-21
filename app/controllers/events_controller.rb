class EventsController < ApplicationController

	before_filter :check
 	
  
	def index
		redirect_to(:controller=> "calendar",:action => 'show' )
	end
	

	def show
		@event = Event.find(params[:id])
		
	end

	def new
			@event = Event.new
			
	end

	def create
		@event = Event.new(params[:event])
		if @event.save
			@m_type = "success"
			@message = "Event created!"
			@success = true
		else
			@success = false
			flash[:error]="Event not created!!"
		end
		respond_to do |format|
			format.js
		end
	end

	def edit
		@event = Event.find(params[:id])
		
	end
	def update
		@event = Event.find(params[:id])

		if @event.update_attributes(params[:event])

			flash[:notice]="Event Updated!!"
			redirect_to(:controller=> "calendar",:action => 'show' )
		else
		
			render('edit')
		end	
		
	end

	def delete
		@event = Event.find(params[:id])
		
	end

	def destroy
		Event.find(params[:id]).destroy
		flash[:notice]="Event Deleted!!"
		redirect_to(:controller=> "calendar",:action => 'show' )
	end

	 private
 	def check
   		if(session[:user_id] == nil)
    		redirect_to(:controller => "connect", :action => 'login_page')
    	
      
    	end
   	end

end
