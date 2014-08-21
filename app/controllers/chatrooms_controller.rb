class ChatroomsController < ApplicationController
	respond_to :js, :html
  def index
    @chatrooms = Chatroom.all
  end

  def create
    	@chatroom = Chatroom.new(params[:chatroom])
    	userID=session[:user_id]
      user=User.find_by_id(userID)
    	@chatroom.name = user.first_name
    	@chatroom.save!
    respond_to do |format|
    		format.js
	end
  end
end
