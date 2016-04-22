class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true, uniqueness: true
  validates_integrity_of :avatar
  validates_processing_of :avatar
  validates_download_of :avatar
  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy
end
