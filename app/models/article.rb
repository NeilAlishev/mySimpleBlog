class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user

  scope :recent, -> (page = 1) { order("created_at desc").page(page).per(5) }

  validates :title, :content, presence: true

  delegate :full_name, to: :user, prefix: :user
  delegate :id, to: :user, prefix: :user
end
