class HomeController < ApplicationController

  #Displaying all the blogs
  def index
    @articles = Article.get_all_articles
  end

  #Display particular blog with comments
  def view_blog
    @article = Article.find(params[:id])
    @comments = Comment.get_comments(params[:id])
  end
end
