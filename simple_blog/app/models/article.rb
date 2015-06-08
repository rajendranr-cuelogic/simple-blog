class Article < ActiveRecord::Base
  #Validations
  validates :title, :body, presence: true

  #Associations
  belongs_to :user
  has_many :comments, dependent: :destroy

  def self.get_all_articles
    return Article.all
  end

end
