class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  validates :content, :user, :article, presence: true
  delegate :full_name, to: :user, prefix: true
end
