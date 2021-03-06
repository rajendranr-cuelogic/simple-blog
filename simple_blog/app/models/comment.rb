class Comment < ActiveRecord::Base
  #Validations
  validates :name, :body, presence: true

  #Associations
  belongs_to :article

  def self.get_comments(article_id)
    comments = Article.find(article_id).comments
    return comments
  end
end
