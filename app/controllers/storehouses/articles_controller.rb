class Storehouses::ArticlesController < ApplicationController
	def new
		@article = Article.new
	end
end
