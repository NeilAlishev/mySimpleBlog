class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  validates :content, :user, :article, presence: true
end
