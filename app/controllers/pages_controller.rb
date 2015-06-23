class PagesController < ApplicationController
	def home
		@storehouses = Storehouse.all
		@last_articles = Article.last(10)		
	end

	def about_us
	end

  def stores
    @storehouses = Storehouse.all
  end
end
