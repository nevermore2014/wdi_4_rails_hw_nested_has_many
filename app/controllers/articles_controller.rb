class ArticlesController < ApplicationController

	before_action :get_user

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(params[:article])
		@article.save!
	end

	private

	def article_params
		params.require(article).permit(:body)
	end

	def get_user
		@user = User.find(params[:user_id]) if params.key?(:user_id)
	end

end
