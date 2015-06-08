class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :load_article

  respond_to :html


  def new
    @comment = Comment.new
    respond_with(@comment)
  end

  def create
    @comment = @article.comments.new(comment_params)
    if @comment.save
      redirect_to @article, :notice => 'Thanks for your comment'
    else
      redirect_to @article, :alert => 'Unable to add comment'
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def load_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:article_id, :name, :email, :body)
  end

end
