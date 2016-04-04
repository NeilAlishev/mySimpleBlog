class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  validates :content, presence: true
  delegate :full_name, to: :user, prefix: true
end
