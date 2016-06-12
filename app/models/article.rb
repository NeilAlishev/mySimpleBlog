class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }
  scope :by_query, -> (query) { ArticleQuery.new.search(query) if query.present? }

  validates :title, :content, presence: true

  delegate :full_name, to: :user, prefix: :user
  delegate :id, to: :user, prefix: :user
end
