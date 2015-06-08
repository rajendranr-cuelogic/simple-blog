class HomeController < ApplicationController

  def index
    @articles = Article.get_all_articles
  end

  def view_blog
    @article = Article.find(params[:id])
    @comments = Comment.get_comments(params[:id])
  end
end
