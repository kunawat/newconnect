

class PollController < ApplicationController
		before_filter :check
 	


	
	def poll_new
		hash = params[:poll]
		@new_poll = Poll.create(:question => hash[:question], :end_date => hash[:end_date], :created_by => session[:user_id])
		
		PollOption.create(:keyword => hash[:option1], :poll_id => @new_poll.id)
		PollOption.create(:keyword => hash[:option2], :poll_id => @new_poll.id)
	    PollOption.create(:keyword => hash[:option3], :poll_id => @new_poll.id)
		PollOption.create(:keyword => hash[:option4], :poll_id => @new_poll.id)
		PollOption.create(:keyword => hash[:option5], :poll_id => @new_poll.id)
		redirect_to(:controller => "home", :action => 'home_page')
	end	

	def view_result
		poll_id = params[:poll_id]
		session[:poll_id] = poll_id
	end

	def vote
		poll_id = params[:poll_id]
		session[:poll_id] = poll_id
		user_id = params[:user_id]
		
	end

	def vote_now
		user_id = session[:user_id]
		poll_id = params[:poll_id]
		poll = Poll.find_by_id(poll_id)
		polluser = poll.poll_users.find_by_user_id(user_id)
		if polluser.nil?
			session[:vote] = true;
			PollUser.create(:user_id => user_id, :poll_id => poll_id)
			optionid = params[:option_id]
			option = Poll.find_by_id(poll_id).poll_options.find_by_id(optionid)
			option.votes = option.votes + 1
			option.save
			redirect_to(:action => "view_polls")
		else
			session[:vote] = false;
			render :text => "Error : You already voted. Go Back to return to polls"
			return
		end		
		
	end

	def view_polls
	end

	   private
	 	def check
   		if(session[:user_id] == nil)
    		redirect_to(:controller => "connect", :action => 'login_page')
    	
      
    	end
   	
   	end
end
