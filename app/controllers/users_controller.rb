class UsersController < ApplicationController
	
	
	def show
		@user = User.find(params[:id])
		
	end

	def edit
		@user = User.find(params[:id])
		
	end
	def update
		@user = User.find(params[:id])

		if @user.update_attributes(params[:user])
		
			flash[:notice]="Profile Updated!!"
			render ('show')
		else
			render('edit')
		end	
		
	end

	def board_members
		
		@members=User.all
		
	end

	

end
