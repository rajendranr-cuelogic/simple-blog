class HomeController < ApplicationController

  def index
    @articles = Article.get_all_articles
  end
end
