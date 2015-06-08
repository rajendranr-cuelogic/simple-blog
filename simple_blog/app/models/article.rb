class Article < ActiveRecord::Base
  #Validations
  validates :title, :body, presence: true

  #Associations
  belongs_to :user
  has_many :comments, dependent: :destroy

  #Scope
  scope :published, where("articles.published_at IS NOT NULL")
  scope :draft, where("articles.published_at IS NULL")

  def long_title
    "#{title} - #{published_at}"
  end
end
