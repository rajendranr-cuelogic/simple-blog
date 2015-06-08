class Article < ActiveRecord::Base
  #Validations
  validates :title, :body, presence: true

  #Associations
  belongs_to :user

  def long_title
    "#{title} - #{published_at}"
  end
end
