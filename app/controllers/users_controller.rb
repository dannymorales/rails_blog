class UsersController < ApplicationController

	def index
		@users = User.all.order("created_at ASC")
	end

	# def show
	# 	@user = User.find(params[:id])
	# end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to root_path
	end
end
