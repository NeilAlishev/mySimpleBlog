class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  default_scope { order(created_at: :desc) }
  validates :title, presence: true
  validates :content, presence: true
  delegate :full_name, to: :user, prefix: true
end
