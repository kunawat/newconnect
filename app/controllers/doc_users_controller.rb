class DocUsersController < ApplicationController
  # GET /doc_users
  # GET /doc_users.json
  before_filter :check
  respond_to :json, :html

  def index
    @doc_users = DocUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @doc_users }
    end
  end

  # GET /doc_users/1
  # GET /doc_users/1.json
  def show
    @doc_user = DocUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @doc_user }
    end
  end

  # GET /doc_users/new
  # GET /doc_users/new.json
  def new
    @doc_user = DocUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @doc_user }
    end
  end

  # GET /doc_users/1/edit
  def edit
    @doc_user = DocUser.find(params[:id])
  end

  # POST /doc_users
  # POST /doc_users.json
  def create
    @doc_user = DocUser.new(params[:doc_user])
      userID=session[:user_id]
    user=User.find_by_id(userID)
    @doc_user.name = user.first_name
    @doc_user.email = user.email

    respond_to do |format|
      if @doc_user.save
        format.html { redirect_to @doc_user, notice: 'Doc was successfully uploaded' }
        format.json { render json: @doc_user, status: :created, location: @doc_user }
      else
        format.html { render action: "new" }
        format.json { render json: @doc_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /doc_users/1
  # PUT /doc_users/1.json
  def update
    @doc_user = DocUser.find(params[:id])

    respond_to do |format|
      if @doc_user.update_attributes(params[:doc_user])
        format.html { redirect_to @doc_user, notice: 'Doc user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @doc_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doc_users/1
  # DELETE /doc_users/1.json
  def destroy
    @doc_user = DocUser.find(params[:id])
    @doc_user.destroy

    respond_to do |format|
      format.html { redirect_to doc_users_url }
      format.json { head :no_content }
    end
  end

  private
  
  

    def check
      if(session[:user_id] == nil)
        redirect_to(:controller => "connect", :action => 'login_page')
      
      
      end
    
    end
end
