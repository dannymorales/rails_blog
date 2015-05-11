class CommentsController < ApplicationController
	before_filter :require_permission, only :edit

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:name, :body))
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
	end

	def show
		@comment = Comment.find(params[:id])
		@comment.user
	end
	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update	
		
	end
	def require_permission
		if current_user != Comment.find(params[:id]).user
		redirect_to root_path		
	end
end
