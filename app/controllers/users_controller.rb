class UsersController < ApplicationController


	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:name])
		@user.save!
	end

	def create
		User.all << User.create!(users_params)
		redirect_to users_path
	end

	private

	def users_params
		params.require(:user).permit(:name)
	end

end
