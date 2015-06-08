class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :load_article

  respond_to :html

  #Adding new comment for a particular Blog
  def new
    @comment = Comment.new
    respond_with(@comment)
  end

  #Creating the comment for a particular Blog
  def create
    @comment = @article.comments.new(comment_params)
    if @comment.save
      redirect_to @article, :notice => 'Thanks for your comment'
    else
      redirect_to @article, :alert => 'Unable to add comment'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def load_article
    @article = Article.find(params[:article_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:article_id, :name, :email, :body)
  end

end
