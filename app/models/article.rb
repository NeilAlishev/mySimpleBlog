class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

  validates :title, :content, presence: true

  delegate :full_name, to: :user, prefix: true
  delegate :avatar, to: :user, prefix: true
end
