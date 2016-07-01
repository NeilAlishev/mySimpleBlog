class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }
  scope :by_author, -> (author) { where(user: User.find_by(full_name: author)) }

  validates :title, :content, presence: true

  delegate :full_name, to: :user, prefix: true
  delegate :avatar, to: :user, prefix: true
end
