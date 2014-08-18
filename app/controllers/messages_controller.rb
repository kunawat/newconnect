class MessagesController < ApplicationController


  respond_to :js, :html
  def index
      userID=session[:user_id]
    user=User.find_by_id(userID)
    sender= user.first_name

    @receiver = User.find(params[:id])

    @messages = Message.where("(name = ? AND receiver_id = ?) OR (name = ? AND receiver_id = ?)", sender, @receiver.id,  @receiver.first_name, user.id)
    respond_to do |format|
      format.js
    end
  end

 

  def create
  	@message = Message.new(params[:message])
  	userID=session[:user_id]
    @user=User.find_by_id(userID)
  	@message.name = @user.first_name
    @message.receiver_id = params[:receiver_id] 
    @message.save
  	respond_to do |format|
  		format.js
		end
  end
end
