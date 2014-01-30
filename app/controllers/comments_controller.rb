class CommentsController < ApplicationController
	before_action :get_article

	def index
		if !@article
			@comments = Comment.all
		else
			@comments = @article.comments
		end
	end

	def new
		@comment = Comment.new
	end

	def create
		@article.comments << Comment.create!(comments_params)
		redirect_to article_path(@article.id)
	end

	private

	def comments_params
		params.require(:comment).permit(:body)
	end

	def get_article
		@article = Article.find(params[:article_id]) if params.key?(:article_id)
	end

end
