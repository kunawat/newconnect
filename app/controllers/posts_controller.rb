class PostsController < ApplicationController

	def create_post
		
	end

	def create_comment
		hash = params[:comment]
		comment = Comment.create(:content => hash[:content], :post_id => params[:post_id], :created_by => session[:user_id])	
		redirect_to(:controller => "posts", :action => 'show_comments', :post_id => params[:post_id])				
	end	

	def show_comments
		@post_id = params[:post_id]
		@comments = Comment.where(post_id: @post_id)
	end	

	def show_posts
		@posts = Post.order("id DESC").all;
		@comments = Comment.all;
		respond_to do |format|
			format.html { render :controller => "home", :action =>'home_page'}
			format.js { render :action => 'show_posts'}
		end		
	end

	def create_new_post
		hash = params[:post]
		@new_post = Post.create(:content => hash[:content], :created_by => session[:user_id])
		redirect_to(:controller => "home", :action => "home_page")
	end
end