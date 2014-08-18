class MailsController < ApplicationController

	before_filter :check
 	

	def show_mails
		if (params[:type] == 'inbox')
			@mails = Email.where(reciever_id: session[:user_id]).where("recieved_status != ?", 'deleted')
		else
			@mails = Email.where(sender_id: session[:user_id]).where("sent_status != ?", 'deleted')
		end
	end

	def new_mail
		hash = params[:mail]
		Email.create(:sender => User.find_by_id(session[:user_id]).username, :recipient => hash[:to], :subject => hash[:subject],
					 :content => hash[:content], :recieved_status => "Unread", :sent_status => 'sent', :sender_id => session[:user_id],
					 :reciever_id => User.find_by_username(hash[:to]).id)
		redirect_to :action => 'show_mails', :type => 'inbox'
	end

	def delete_mail
		emailid = params[:id]
		mail = Email.find_by_id(emailid)
		username = User.find_by_id(session[:user_id]).username
		if(username == mail.sender)
			mail.sent_status = 'deleted'
		end
		if (username == mail.recipient)
			mail.recieved_status = 'deleted'
		end
		mail.save
		redirect_to(:action => "show_mails", :type => 'inbox')	
	end

	def show_content
		mailid = params[:email_id]
		mail = Email.find_by_id(mailid)
		mail.recieved_status = 'Read'
		mail.save
	end
	   private
	 	def check
   		if(session[:user_id] == nil)
    		redirect_to(:controller => "connect", :action => 'login_page')
    	
      
    	end
   	
   	end
	
end
