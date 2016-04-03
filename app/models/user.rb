class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true, uniqueness: true
  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy
end
