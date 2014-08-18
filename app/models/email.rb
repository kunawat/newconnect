
class Email < ActiveRecord::Base
	attr_accessible :sender, :recipient, :subject, :content, :recieved_status, :sender_id, :reciever_id, :sent_status 
end
