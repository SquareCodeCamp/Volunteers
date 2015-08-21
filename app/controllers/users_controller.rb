class UsersController < ApplicationController
	respond_to :html

	def index
		@users = User.all
		respond_with @users
	end

	def new
		@user = User.new
		respond_with @user
	end

	def create
		@user = User.create(user_params)
		# @user = user.new(user_params)
		respond_with @user, location: root_url
	end

private

	def user_params
	  params.require(:user).permit(:name, :email, :password)
	end

end
