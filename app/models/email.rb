
class Email < ActiveRecord::Base
	attr_accessible :sender, :recipient, :subject, :content, :attach, :recieved_status, :sender_id, :reciever_id, :sent_status 

	has_attached_file :attach, :default_url => "/assets/error.png"
end
